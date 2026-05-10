; DESCRIPTION: Composite: Renders a blue line between points (458, 239) and (99, 139) then Places a black dot at position (73, 124) then Creates a black circular shape at (450, 165) with radius 30.
; PLAN: r0=458(x1), r1=239(y1), r2=99(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=73(x), r6=124(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=450(x), r11=165(y), r12=30(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 458
LDI r1, 239
LDI r2, 99
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 124
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 450
LDI r11, 165
LDI r12, 30
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
