; DESCRIPTION: Composite: Creates a blue rectangular region at (285, 191) spanning 35 by 64 pixels then Renders a blue disk with center (199, 181) and radius 47.
; PLAN: r0=285(x), r1=191(y), r2=35(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=181(y), r7=47(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 285
LDI r1, 191
LDI r2, 35
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 181
LDI r7, 47
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
