; DESCRIPTION: Composite: Creates a green rectangular region at (235, 180) spanning 59 by 68 pixels then Places a black line segment connecting (142, 105) to (262, 76) then Sets a single purple pixel at (237, 94).
; PLAN: r0=235(x), r1=180(y), r2=59(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=142(x1), r6=105(y1), r7=262(x2), r8=76(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=237(x), r11=94(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 235
LDI r1, 180
LDI r2, 59
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 105
LDI r7, 262
LDI r8, 76
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 237
LDI r11, 94
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
