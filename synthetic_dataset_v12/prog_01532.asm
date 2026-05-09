; DESCRIPTION: Composite: Renders a white box of size 49x108 starting at (264, 109) then Renders a cyan line between points (185, 130) and (482, 81) then Sets a single red pixel at (74, 43).
; PLAN: r0=264(x), r1=109(y), r2=49(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=185(x1), r6=130(y1), r7=482(x2), r8=81(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=74(x), r11=43(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 264
LDI r1, 109
LDI r2, 49
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 130
LDI r7, 482
LDI r8, 81
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 74
LDI r11, 43
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
