; DESCRIPTION: Composite: Places a cyan dot at position (359, 12) then Renders a orange box of size 23x28 starting at (485, 14) then Creates a blue circular shape at (341, 112) with radius 74.
; PLAN: r0=359(x), r1=12(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=485(x), r6=14(y), r7=23(width), r8=28(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=341(x), r11=112(y), r12=74(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 359
LDI r1, 12
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 485
LDI r6, 14
LDI r7, 23
LDI r8, 28
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 112
LDI r12, 74
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
