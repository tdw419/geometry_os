; DESCRIPTION: Composite: . Then Draws a purple line from (17, 172) to (250, 34). Then Places a orange dot at position (22, 109).
; PLAN: r0=17(x1), r1=172(y1), r2=250(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=22(x), r1=109(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple line from (17, 172) to (250, 34).
; PLAN: r0=17(x1), r1=172(y1), r2=250(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 172
LDI r2, 250
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (22, 109).
; PLAN: r0=22(x), r1=109(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 22
LDI r1, 109
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
