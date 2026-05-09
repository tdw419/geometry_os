; DESCRIPTION: Composite: Renders a red box of size 68x67 starting at (373, 109) then Draws a cyan line from (172, 62) to (49, 63) then Renders a black disk with center (348, 181) and radius 24.
; PLAN: r0=373(x), r1=109(y), r2=68(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x1), r6=62(y1), r7=49(x2), r8=63(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=348(x), r11=181(y), r12=24(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 373
LDI r1, 109
LDI r2, 68
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 62
LDI r7, 49
LDI r8, 63
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 348
LDI r11, 181
LDI r12, 24
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
