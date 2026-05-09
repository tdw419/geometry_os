; DESCRIPTION: Composite: . Then Draws a yellow line from (25, 170) to (221, 96). Then Places a orange circle of radius 30 at center (54, 64).
; PLAN: r0=25(x1), r1=170(y1), r2=221(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=54(x), r1=64(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow line from (25, 170) to (221, 96).
; PLAN: r0=25(x1), r1=170(y1), r2=221(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 170
LDI r2, 221
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange circle of radius 30 at center (54, 64).
; PLAN: r0=54(x), r1=64(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 64
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
