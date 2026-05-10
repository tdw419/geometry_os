; DESCRIPTION: Composite: Draws a white line from (280, 138) to (500, 85) then Renders a blue disk with center (162, 91) and radius 73.
; PLAN: r0=280(x1), r1=138(y1), r2=500(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=91(y), r7=73(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 280
LDI r1, 138
LDI r2, 500
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 91
LDI r7, 73
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
