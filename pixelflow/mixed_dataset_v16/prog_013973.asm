; DESCRIPTION: Composite: Renders a purple line between points (153, 111) and (92, 4) then Renders a blue box of size 80x88 starting at (87, 79) then Places a white dot at position (484, 237).
; PLAN: r0=153(x1), r1=111(y1), r2=92(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=87(x), r6=79(y), r7=80(width), r8=88(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=484(x), r11=237(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 153
LDI r1, 111
LDI r2, 92
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 79
LDI r7, 80
LDI r8, 88
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 484
LDI r11, 237
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
