; DESCRIPTION: Draws a red object at the screen with fixed size.

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
    LDI r4, 1
    SNAP_TRACE r4

    ; Draw red pixel at (10, 10)
    LDI r0, 10
    LDI r7, 10
    LDI r10, 0xFF0000
    PSET r0, r7, r10

    ; Draw green pixel at (10, 10) -- overwriting red
    LDI r10, 0x00FF00
    PSET r0, r7, r10

    ; Draw blue pixel at (10, 10) -- overwriting green
    LDI r10, 0x0000FF
    PSET r0, r7, r10

    ; Query: how many writes to pixel (10, 10)?
    LDI r4, 1           ; mode 1 = count at pixel
    LDI r0, 10          ; x
    LDI r7, 10          ; y
    PIXEL_HISTORY r4
    ; r4 = 3 (three writes)

    ; Retrieve the write history into RAM at 0x1000
    LDI r4, 2           ; mode 2 = get recent writes
    LDI r0, 10          ; x
    LDI r7, 10          ; y
    LDI r10, 10          ; max_count
    LDI r3, 0x1000      ; buffer address
    PIXEL_HISTORY r4
    ; r4 = 3 (entries written), RAM[0x1000..0x1011] has the data

    ; Show total entries in log
    LDI r4, 0           ; mode 0 = count total
    PIXEL_HISTORY r4
    ; r4 = 3

    ; Display the history as colored bars on screen
    ; Entry 0 (newest = blue): draw bar at y=20
    LDI r2, 0x1000      ; entry 0 base
    LOAD r11, 12, r2     ; color field (offset 5 in entry)
    LDI r0, 20          ; x
    LDI r7, 20          ; y
    RECTF r0, r7, r10, r7, r11  ; 3x3 colored square

    ; Entry 1 (green): draw bar at y=30
    LDI r2, 0x1006      ; entry 1 base (6 words per entry)
    LOAD r11, 12, r2
    LDI r7, 30
    RECTF r0, r7, r10, r7, r11

    ; Entry 2 (oldest = red): draw bar at y=40
    LDI r2, 0x100C      ; entry 2 base
    LOAD r11, 12, r2
    LDI r7, 40
    RECTF r0, r7, r10, r7, r11

    ; Label
    LDI r0, 50
    LDI r7, 55
    LDI r10, msg
    TEXT r0, r7, r10

    FRAME
    HALT

msg: .ascii "Pixel History: 3 writes"
     .db 0
