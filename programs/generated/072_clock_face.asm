; clock_face.asm -- Analog clock showing 3:00
; Outer circle, 12 hour marks, hour hand (3 o'clock), minute hand (12 o'clock)

; Draw clock face circle (center 128,128 radius 100)
LDI r0, 128
LDI r1, 128
LDI r2, 100
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3

; Draw inner circle for style
LDI r2, 95
LDI r3, 0x888888
CIRCLE r0, r1, r2, r3

; Hour marks -- outer at r=100, inner at r=85
; Color for marks
LDI r3, 0xFFFFFF

; 12 o'clock (top)
LDI r0, 128
LDI r1, 28
LDI r2, 128
LDI r5, 43
LINE r0, r1, r2, r5, r3

; 1 o'clock
LDI r0, 178
LDI r1, 41
LDI r2, 172
LDI r5, 55
LINE r0, r1, r2, r5, r3

; 2 o'clock
LDI r0, 215
LDI r1, 78
LDI r2, 204
LDI r5, 84
LINE r0, r1, r2, r5, r3

; 3 o'clock (right)
LDI r0, 228
LDI r1, 128
LDI r2, 213
LDI r5, 128
LINE r0, r1, r2, r5, r3

; 4 o'clock
LDI r0, 215
LDI r1, 178
LDI r2, 204
LDI r5, 172
LINE r0, r1, r2, r5, r3

; 5 o'clock
LDI r0, 178
LDI r1, 215
LDI r2, 172
LDI r5, 204
LINE r0, r1, r2, r5, r3

; 6 o'clock (bottom)
LDI r0, 128
LDI r1, 228
LDI r2, 128
LDI r5, 213
LINE r0, r1, r2, r5, r3

; 7 o'clock
LDI r0, 78
LDI r1, 215
LDI r2, 84
LDI r5, 204
LINE r0, r1, r2, r5, r3

; 8 o'clock
LDI r0, 41
LDI r1, 178
LDI r2, 52
LDI r5, 172
LINE r0, r1, r2, r5, r3

; 9 o'clock (left)
LDI r0, 28
LDI r1, 128
LDI r2, 43
LDI r5, 128
LINE r0, r1, r2, r5, r3

; 10 o'clock
LDI r0, 41
LDI r1, 78
LDI r2, 52
LDI r5, 84
LINE r0, r1, r2, r5, r3

; 11 o'clock
LDI r0, 78
LDI r1, 41
LDI r2, 84
LDI r5, 55
LINE r0, r1, r2, r5, r3

; Hour hand pointing to 3 (short, red)
LDI r0, 128
LDI r1, 128
LDI r2, 178
LDI r5, 128
LDI r3, 0xFF0000
LINE r0, r1, r2, r5, r3

; Minute hand pointing to 12 (long, green)
LDI r0, 128
LDI r1, 128
LDI r2, 128
LDI r5, 50
LDI r3, 0x00FF00
LINE r0, r1, r2, r5, r3

; Center dot
LDI r0, 128
LDI r1, 128
LDI r2, 5
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3

HALT
