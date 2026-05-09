; DESCRIPTION: Composite: . Then Draws a blue line from (202, 27) to (248, 109). Then Draws a purple circle centered at (170, 30) with radius 15.
; PLAN: r0=202(x1), r1=27(y1), r2=248(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=170(x), r1=30(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a blue line from (202, 27) to (248, 109).
; PLAN: r0=202(x1), r1=27(y1), r2=248(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 27
LDI r2, 248
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (170, 30) with radius 15.
; PLAN: r0=170(x), r1=30(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 30
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
