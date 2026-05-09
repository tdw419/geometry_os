; DESCRIPTION: Composite: Renders a blue box of size 62x80 starting at (348, 148) then Renders a purple disk with center (131, 177) and radius 11 then Draws a cyan line from (461, 217) to (275, 30).
; PLAN: r0=348(x), r1=148(y), r2=62(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=131(x), r6=177(y), r7=11(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=461(x1), r11=217(y1), r12=275(x2), r13=30(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 148
LDI r2, 62
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 177
LDI r7, 11
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 461
LDI r11, 217
LDI r12, 275
LDI r13, 30
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
