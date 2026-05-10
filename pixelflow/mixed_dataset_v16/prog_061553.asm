; DESCRIPTION: Composite: Creates a yellow rectangular region at (56, 0) spanning 49 by 93 pixels then Renders a black disk with center (317, 163) and radius 77.
; PLAN: r0=56(x), r1=0(y), r2=49(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x), r6=163(y), r7=77(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 56
LDI r1, 0
LDI r2, 49
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 163
LDI r7, 77
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
