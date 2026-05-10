; DESCRIPTION: Composite: Sets a single yellow pixel at (348, 173) then Renders a yellow box of size 50x60 starting at (96, 191) then Places a purple circle of radius 47 at center (246, 94).
; PLAN: r0=348(x), r1=173(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=96(x), r6=191(y), r7=50(width), r8=60(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=246(x), r11=94(y), r12=47(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 348
LDI r1, 173
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 96
LDI r6, 191
LDI r7, 50
LDI r8, 60
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 246
LDI r11, 94
LDI r12, 47
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
