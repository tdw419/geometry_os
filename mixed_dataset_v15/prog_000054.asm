; DESCRIPTION: Composite: Draws a cyan circle centered at (226, 156) with radius 17 then Renders a blue line between points (223, 130) and (322, 119) then Places a green dot at position (324, 246).
; PLAN: r0=226(x), r1=156(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=223(x1), r6=130(y1), r7=322(x2), r8=119(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=324(x), r11=246(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 226
LDI r1, 156
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 223
LDI r6, 130
LDI r7, 322
LDI r8, 119
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 324
LDI r11, 246
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
