; DESCRIPTION: Composite: Sets a single blue pixel at (289, 18) then Renders a purple line between points (319, 215) and (447, 81) then Creates a white rectangular region at (103, 112) spanning 41 by 112 pixels.
; PLAN: r0=289(x), r1=18(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=319(x1), r6=215(y1), r7=447(x2), r8=81(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=103(x), r11=112(y), r12=41(width), r13=112(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 289
LDI r1, 18
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 319
LDI r6, 215
LDI r7, 447
LDI r8, 81
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 112
LDI r12, 41
LDI r13, 112
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
