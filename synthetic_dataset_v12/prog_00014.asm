; DESCRIPTION: Composite: Places a black line segment connecting (39, 210) to (375, 55) then Renders a purple box of size 94x114 starting at (109, 7) then Places a yellow dot at position (147, 192).
; PLAN: r0=39(x1), r1=210(y1), r2=375(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=7(y), r7=94(width), r8=114(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=147(x), r11=192(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 39
LDI r1, 210
LDI r2, 375
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 7
LDI r7, 94
LDI r8, 114
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 147
LDI r11, 192
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
