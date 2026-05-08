; DESCRIPTION: This GeOS assembly code demonstrates the use of the `PIXEL_HISTORY` function to track and display the history of pixel writes at a specific location. It enables trace recording, draws three differently colored pixels at coordinates (10, 10), queries the write history, retrieves it into RAM, and displays each write as a colored bar on screen, along with a total count of entries in the log.

; pixel_history_demo.asm -- Demonstrates PIXEL_HISTORY (0x84)
; Time-travel debugging: write pixels, then query who wrote to them.
;
; This demo:
; 1. Enables trace recording (SNAP_TRACE mode 1)
; 2. Draws 3 different colored pixels at the same location
; 3. Queries how many times pixel (10,10) was written
; 4. Retrieves the write history and displays each color
; 5. Shows total entries in the log
;
; Controls: Just watch it run -- it's a self-contained demo.

    ; Enable trace recording
    LDI r9, 1
    SNAP_TRACE r9

    ; Draw red pixel at (10, 10)
    LDI r13, 10
    LDI r1, 10
    LDI r10, 0xFF0000
    PSET r13, r1, r10

    ; Draw green pixel at (10, 10) -- overwriting red
    LDI r10, 0x00FF00
    PSET r13, r1, r10

    ; Draw blue pixel at (10, 10) -- overwriting green
    LDI r10, 0x0000FF
    PSET r13, r1, r10

    ; Query: how many writes to pixel (10, 10)?
    LDI r9, 1           ; mode 1 = count at pixel
    LDI r13, 10          ; x
    LDI r1, 10          ; y
    PIXEL_HISTORY r9
    ; r9 = 3 (three writes)

    ; Retrieve the write history into RAM at 0x1000
    LDI r9, 2           ; mode 2 = get recent writes
    LDI r13, 10          ; x
    LDI r1, 10          ; y
    LDI r10, 10          ; max_count
    LDI r12, 0x1000      ; buffer address
    PIXEL_HISTORY r9
    ; r9 = 3 (entries written), RAM[0x1000..0x1011] has the data

    ; Show total entries in log
    LDI r9, 0           ; mode 0 = count total
    PIXEL_HISTORY r9
    ; r9 = 3

    ; Display the history as colored bars on screen
    ; Entry 0 (newest = blue): draw bar at y=20
    LDI r7, 0x1000      ; entry 0 base
    LOAD r2, 12, r7     ; color field (offset 5 in entry)
    LDI r13, 20          ; x
    LDI r1, 20          ; y
    RECTF r13, r1, r10, r1, r2  ; 3x3 colored square

    ; Entry 1 (green): draw bar at y=30
    LDI r7, 0x1006      ; entry 1 base (6 words per entry)
    LOAD r2, 12, r7
    LDI r1, 30
    RECTF r13, r1, r10, r1, r2

    ; Entry 2 (oldest = red): draw bar at y=40
    LDI r7, 0x100C      ; entry 2 base
    LOAD r2, 12, r7
    LDI r1, 40
    RECTF r13, r1, r10, r1, r2

    ; Label
    LDI r13, 50
    LDI r1, 55
    LDI r10, msg
    TEXT r13, r1, r10

    FRAME
    HALT

msg: .ascii "Pixel History: 3 writes"
     .db 0
