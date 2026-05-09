; DESCRIPTION: Composite: Creates a red rectangular region at (43, 73) spanning 56 by 119 pixels then Renders a blue disk with center (426, 130) and radius 79.
; PLAN: r0=43(x), r1=73(y), r2=56(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=426(x), r6=130(y), r7=79(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 43
LDI r1, 73
LDI r2, 56
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 130
LDI r7, 79
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
