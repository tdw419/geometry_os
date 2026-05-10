; DESCRIPTION: Composite: Places a red line segment connecting (187, 206) to (205, 222) then Renders a orange disk with center (80, 105) and radius 65.
; PLAN: r0=187(x1), r1=206(y1), r2=205(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=80(x), r6=105(y), r7=65(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 187
LDI r1, 206
LDI r2, 205
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 105
LDI r7, 65
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
