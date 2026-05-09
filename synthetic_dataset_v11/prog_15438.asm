; DESCRIPTION: Composite: . Then Draws a blue line from (189, 125) to (18, 167). Then Creates a purple circular shape at (65, 83) with radius 30.
; PLAN: r0=189(x1), r1=125(y1), r2=18(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=65(x), r1=83(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a blue line from (189, 125) to (18, 167).
; PLAN: r0=189(x1), r1=125(y1), r2=18(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 125
LDI r2, 18
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (65, 83) with radius 30.
; PLAN: r0=65(x), r1=83(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 83
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
