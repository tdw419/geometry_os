; DESCRIPTION: Composite: . Then Draws a orange line from (118, 115) to (223, 83). Then Places a yellow circle of radius 12 at center (237, 22).
; PLAN: r0=118(x1), r1=115(y1), r2=223(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=237(x), r1=22(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange line from (118, 115) to (223, 83).
; PLAN: r0=118(x1), r1=115(y1), r2=223(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 115
LDI r2, 223
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 12 at center (237, 22).
; PLAN: r0=237(x), r1=22(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 22
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
