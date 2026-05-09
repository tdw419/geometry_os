; DESCRIPTION: Composite: Sets a single purple pixel at (345, 41) then Renders a red line between points (52, 179) and (346, 183) then Creates a cyan rectangular region at (237, 54) spanning 119 by 114 pixels.
; PLAN: r0=345(x), r1=41(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=52(x1), r6=179(y1), r7=346(x2), r8=183(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=237(x), r11=54(y), r12=119(width), r13=114(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 41
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 52
LDI r6, 179
LDI r7, 346
LDI r8, 183
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 237
LDI r11, 54
LDI r12, 119
LDI r13, 114
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
