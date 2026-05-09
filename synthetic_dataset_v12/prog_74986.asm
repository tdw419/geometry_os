; DESCRIPTION: Composite: Renders a red box of size 49x74 starting at (142, 130) then Creates a blue circular shape at (77, 82) with radius 67 then Sets a single magenta pixel at (283, 128).
; PLAN: r0=142(x), r1=130(y), r2=49(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x), r6=82(y), r7=67(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=283(x), r11=128(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 142
LDI r1, 130
LDI r2, 49
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 82
LDI r7, 67
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 283
LDI r11, 128
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
