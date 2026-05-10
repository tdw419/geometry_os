; DESCRIPTION: Composite: Creates a blue rectangular region at (478, 132) spanning 25 by 71 pixels then Renders a cyan disk with center (285, 215) and radius 26.
; PLAN: r0=478(x), r1=132(y), r2=25(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=285(x), r6=215(y), r7=26(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 478
LDI r1, 132
LDI r2, 25
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 215
LDI r7, 26
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
