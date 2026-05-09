; DESCRIPTION: Composite: . Then Draws a black line from (102, 157) to (205, 138). Then Draws a blue circle centered at (172, 104) with radius 65.
; PLAN: r0=102(x1), r1=157(y1), r2=205(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=172(x), r1=104(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black line from (102, 157) to (205, 138).
; PLAN: r0=102(x1), r1=157(y1), r2=205(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 157
LDI r2, 205
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (172, 104) with radius 65.
; PLAN: r0=172(x), r1=104(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 104
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
