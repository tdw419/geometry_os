; DESCRIPTION: Composite: Places a orange line segment connecting (406, 217) to (413, 230) then Renders a black disk with center (164, 127) and radius 66.
; PLAN: r0=406(x1), r1=217(y1), r2=413(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=127(y), r7=66(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 406
LDI r1, 217
LDI r2, 413
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 127
LDI r7, 66
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
