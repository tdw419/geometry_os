; DESCRIPTION: Composite: Renders a red disk with center (481, 74) and radius 23 then Creates a purple rectangular region at (254, 239) spanning 67 by 15 pixels.
; PLAN: r0=481(x), r1=74(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x), r6=239(y), r7=67(width), r8=15(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 481
LDI r1, 74
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 239
LDI r7, 67
LDI r8, 15
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
