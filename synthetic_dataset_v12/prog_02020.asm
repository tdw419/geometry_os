; DESCRIPTION: Composite: Renders a red box of size 84x15 starting at (400, 122) then Places a blue circle of radius 67 at center (114, 77) then Places a white dot at position (348, 142).
; PLAN: r0=400(x), r1=122(y), r2=84(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=114(x), r6=77(y), r7=67(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=348(x), r11=142(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 400
LDI r1, 122
LDI r2, 84
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 77
LDI r7, 67
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 348
LDI r11, 142
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
