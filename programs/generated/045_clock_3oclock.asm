; 045_clock_3oclock.asm -- Clock face showing 3:00
; White circle, yellow hour marks, red hour hand, green minute hand

; Clock face circle
LDI r0, 128       ; cx
LDI r1, 128       ; cy
LDI r2, 100       ; radius
LDI r3, 0xFFFFFF  ; white
CIRCLE r0, r1, r2, r3

; Hour mark color
LDI r3, 0xFFFF00  ; yellow

; 12 o'clock
LDI r4, 128
LDI r5, 33
LDI r6, 128
LDI r7, 50
LINE r4, r5, r6, r7, r3

; 1 o'clock
LDI r4, 176
LDI r5, 46
LDI r6, 167
LDI r7, 60
LINE r4, r5, r6, r7, r3

; 2 o'clock
LDI r4, 210
LDI r5, 81
LDI r6, 196
LDI r7, 89
LINE r4, r5, r6, r7, r3

; 3 o'clock
LDI r4, 223
LDI r5, 128
LDI r6, 206
LDI r7, 128
LINE r4, r5, r6, r7, r3

; 4 o'clock
LDI r4, 210
LDI r5, 175
LDI r6, 196
LDI r7, 167
LINE r4, r5, r6, r7, r3

; 5 o'clock
LDI r4, 176
LDI r5, 210
LDI r6, 167
LDI r7, 196
LINE r4, r5, r6, r7, r3

; 6 o'clock
LDI r4, 128
LDI r5, 223
LDI r6, 128
LDI r7, 206
LINE r4, r5, r6, r7, r3

; 7 o'clock
LDI r4, 81
LDI r5, 210
LDI r6, 89
LDI r7, 196
LINE r4, r5, r6, r7, r3

; 8 o'clock
LDI r4, 46
LDI r5, 175
LDI r6, 60
LDI r7, 167
LINE r4, r5, r6, r7, r3

; 9 o'clock
LDI r4, 33
LDI r5, 128
LDI r6, 50
LDI r7, 128
LINE r4, r5, r6, r7, r3

; 10 o'clock
LDI r4, 46
LDI r5, 81
LDI r6, 60
LDI r7, 89
LINE r4, r5, r6, r7, r3

; 11 o'clock
LDI r4, 81
LDI r5, 46
LDI r6, 89
LDI r7, 60
LINE r4, r5, r6, r7, r3

; Hour hand pointing to 3 (red, from center right)
LDI r3, 0xFF0000
LDI r4, 128
LDI r5, 128
LDI r6, 178
LDI r7, 128
LINE r4, r5, r6, r7, r3

; Minute hand pointing to 12 (green, from center up)
LDI r3, 0x00FF00
LDI r4, 128
LDI r5, 128
LDI r6, 128
LDI r7, 58
LINE r4, r5, r6, r7, r3

; Center dot
LDI r0, 128
LDI r1, 128
LDI r2, 4
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3

HALT
