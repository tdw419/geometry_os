; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (57, 82) to (185, 132). Then Places a orange 15x49 rectangle at position (226, 16).
; PLAN: r0=57(x1), r1=82(y1), r2=185(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=226(x), r1=16(y), r2=15(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow line segment connecting (57, 82) to (185, 132).
; PLAN: r0=57(x1), r1=82(y1), r2=185(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 82
LDI r2, 185
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange 15x49 rectangle at position (226, 16).
; PLAN: r0=226(x), r1=16(y), r2=15(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 16
LDI r2, 15
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
