; DESCRIPTION: Composite: Renders a orange disk with center (76, 116) and radius 19 then Renders a white box of size 30x88 starting at (433, 90) then Sets a single blue pixel at (200, 3).
; PLAN: r0=76(x), r1=116(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x), r6=90(y), r7=30(width), r8=88(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=200(x), r11=3(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 76
LDI r1, 116
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 90
LDI r7, 30
LDI r8, 88
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 200
LDI r11, 3
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
