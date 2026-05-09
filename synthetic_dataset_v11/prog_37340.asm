; DESCRIPTION: Composite: . Then Places a orange circle of radius 18 at center (152, 224). Then Draws a green line from (22, 118) to (52, 197).
; PLAN: r0=152(x), r1=224(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=22(x1), r1=118(y1), r2=52(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 18 at center (152, 224).
; PLAN: r0=152(x), r1=224(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 224
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green line from (22, 118) to (52, 197).
; PLAN: r0=22(x1), r1=118(y1), r2=52(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 118
LDI r2, 52
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
