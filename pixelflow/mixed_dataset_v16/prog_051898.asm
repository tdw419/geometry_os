; DESCRIPTION: Composite: Renders a white box of size 20x80 starting at (379, 6) then Sets a single yellow pixel at (336, 173) then Renders a purple disk with center (433, 155) and radius 41.
; PLAN: r0=379(x), r1=6(y), r2=20(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x), r6=173(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=433(x), r11=155(y), r12=41(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 379
LDI r1, 6
LDI r2, 20
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 173
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 433
LDI r11, 155
LDI r12, 41
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
