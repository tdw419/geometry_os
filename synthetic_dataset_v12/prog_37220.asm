; DESCRIPTION: Composite: Renders a black disk with center (440, 111) and radius 49 then Creates a green rectangular region at (382, 13) spanning 24 by 65 pixels.
; PLAN: r0=440(x), r1=111(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=382(x), r6=13(y), r7=24(width), r8=65(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 440
LDI r1, 111
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 382
LDI r6, 13
LDI r7, 24
LDI r8, 65
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
