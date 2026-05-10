; DESCRIPTION: Composite: Renders a green disk with center (49, 81) and radius 11 then Draws a blue line from (367, 211) to (152, 137).
; PLAN: r0=49(x), r1=81(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x1), r6=211(y1), r7=152(x2), r8=137(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 49
LDI r1, 81
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 211
LDI r7, 152
LDI r8, 137
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
