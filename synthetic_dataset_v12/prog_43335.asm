; DESCRIPTION: Composite: Renders a yellow box of size 58x116 starting at (278, 56) then Renders a black disk with center (485, 53) and radius 10.
; PLAN: r0=278(x), r1=56(y), r2=58(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=485(x), r6=53(y), r7=10(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 278
LDI r1, 56
LDI r2, 58
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 53
LDI r7, 10
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
