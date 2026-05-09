; DESCRIPTION: Composite: Places a green dot at position (412, 33) then Places a blue line segment connecting (124, 41) to (266, 101) then Renders a cyan disk with center (90, 112) and radius 32.
; PLAN: r0=412(x), r1=33(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=124(x1), r6=41(y1), r7=266(x2), r8=101(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=90(x), r11=112(y), r12=32(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 412
LDI r1, 33
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 124
LDI r6, 41
LDI r7, 266
LDI r8, 101
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 112
LDI r12, 32
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
