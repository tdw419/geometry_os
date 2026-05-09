; DESCRIPTION: Composite: Renders a yellow disk with center (324, 126) and radius 77 then Places a red line segment connecting (199, 73) to (243, 88) then Places a black dot at position (507, 254).
; PLAN: r0=324(x), r1=126(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=199(x1), r6=73(y1), r7=243(x2), r8=88(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=507(x), r11=254(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 324
LDI r1, 126
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 199
LDI r6, 73
LDI r7, 243
LDI r8, 88
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 507
LDI r11, 254
LDI r12, 0x000000
PSET r10, r11, r12
HALT
