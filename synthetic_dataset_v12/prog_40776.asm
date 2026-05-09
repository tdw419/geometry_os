; DESCRIPTION: Composite: Sets a single blue pixel at (49, 43) then Renders a yellow box of size 78x91 starting at (213, 16) then Renders a purple line between points (127, 235) and (46, 20).
; PLAN: r0=49(x), r1=43(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=213(x), r6=16(y), r7=78(width), r8=91(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=127(x1), r11=235(y1), r12=46(x2), r13=20(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 43
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 213
LDI r6, 16
LDI r7, 78
LDI r8, 91
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 127
LDI r11, 235
LDI r12, 46
LDI r13, 20
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
