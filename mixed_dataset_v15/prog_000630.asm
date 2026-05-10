; DESCRIPTION: Composite: Renders a purple box of size 74x73 starting at (94, 4) then Renders a yellow line between points (133, 130) and (325, 225) then Places a blue dot at position (487, 55).
; PLAN: r0=94(x), r1=4(y), r2=74(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=133(x1), r6=130(y1), r7=325(x2), r8=225(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=487(x), r11=55(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 94
LDI r1, 4
LDI r2, 74
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 130
LDI r7, 325
LDI r8, 225
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 487
LDI r11, 55
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
