; DESCRIPTION: Composite: Sets a single cyan pixel at (348, 57) then Creates a yellow rectangular region at (256, 146) spanning 94 by 36 pixels then Renders a purple line between points (172, 238) and (327, 142).
; PLAN: r0=348(x), r1=57(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=256(x), r6=146(y), r7=94(width), r8=36(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=172(x1), r11=238(y1), r12=327(x2), r13=142(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 57
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 256
LDI r6, 146
LDI r7, 94
LDI r8, 36
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 238
LDI r12, 327
LDI r13, 142
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
