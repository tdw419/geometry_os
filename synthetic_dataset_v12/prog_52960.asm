; DESCRIPTION: Composite: Renders a white line between points (423, 1) and (157, 94) then Sets a single purple pixel at (109, 246) then Renders a red box of size 20x18 starting at (394, 176).
; PLAN: r0=423(x1), r1=1(y1), r2=157(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=246(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=394(x), r11=176(y), r12=20(width), r13=18(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 1
LDI r2, 157
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 246
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 394
LDI r11, 176
LDI r12, 20
LDI r13, 18
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
