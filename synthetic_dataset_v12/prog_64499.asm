; DESCRIPTION: Composite: Sets a single blue pixel at (460, 9) then Places a red 63x60 rectangle at position (81, 122) then Places a orange circle of radius 33 at center (435, 189).
; PLAN: r0=460(x), r1=9(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=81(x), r6=122(y), r7=63(width), r8=60(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=435(x), r11=189(y), r12=33(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 460
LDI r1, 9
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 81
LDI r6, 122
LDI r7, 63
LDI r8, 60
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 189
LDI r12, 33
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
