; DESCRIPTION: A red object centered at the screen with fixed size.

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
    LDI r1, 1
    SNAP_TRACE r1

    ; Draw red pixel at (10, 10)
    LDI r12, 10
    LDI r8, 10
    LDI r4, 0xFF0000
    PSET r12, r8, r4

    ; Draw green pixel at (10, 10) -- overwriting red
    LDI r4, 0x00FF00
    PSET r12, r8, r4

    ; Draw blue pixel at (10, 10) -- overwriting green
    LDI r4, 0x0000FF
    PSET r12, r8, r4

    ; Query: how many writes to pixel (10, 10)?
    LDI r1, 1           ; mode 1 = count at pixel
    LDI r12, 10          ; x
    LDI r8, 10          ; y
    PIXEL_HISTORY r1
    ; r1 = 3 (three writes)

    ; Retrieve the write history into RAM at 0x1000
    LDI r1, 2           ; mode 2 = get recent writes
    LDI r12, 10          ; x
    LDI r8, 10          ; y
    LDI r4, 10          ; max_count
    LDI r15, 0x1000      ; buffer address
    PIXEL_HISTORY r1
    ; r1 = 3 (entries written), RAM[0x1000..0x1011] has the data

    ; Show total entries in log
    LDI r1, 0           ; mode 0 = count total
    PIXEL_HISTORY r1
    ; r1 = 3

    ; Display the history as colored bars on screen
    ; Entry 0 (newest = blue): draw bar at y=20
    LDI r3, 0x1000      ; entry 0 base
    LOAD r13, 12, r3     ; color field (offset 5 in entry)
    LDI r12, 20          ; x
    LDI r8, 20          ; y
    RECTF r12, r8, r4, r8, r13  ; 3x3 colored square

    ; Entry 1 (green): draw bar at y=30
    LDI r3, 0x1006      ; entry 1 base (6 words per entry)
    LOAD r13, 12, r3
    LDI r8, 30
    RECTF r12, r8, r4, r8, r13

    ; Entry 2 (oldest = red): draw bar at y=40
    LDI r3, 0x100C      ; entry 2 base
    LOAD r13, 12, r3
    LDI r8, 40
    RECTF r12, r8, r4, r8, r13

    ; Label
    LDI r12, 50
    LDI r8, 55
    LDI r4, msg
    TEXT r12, r8, r4

    FRAME
    HALT

msg: .ascii "Pixel History: 3 writes"
     .db 0
