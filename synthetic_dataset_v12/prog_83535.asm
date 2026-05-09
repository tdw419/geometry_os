; DESCRIPTION: Composite: Places a blue circle of radius 73 at center (386, 100) then Sets a single cyan pixel at (283, 7) then Renders a green line between points (204, 3) and (158, 104).
; PLAN: r0=386(x), r1=100(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x), r6=7(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=204(x1), r11=3(y1), r12=158(x2), r13=104(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 100
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 7
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 204
LDI r11, 3
LDI r12, 158
LDI r13, 104
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
