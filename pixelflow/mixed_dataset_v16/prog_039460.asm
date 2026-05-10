; DESCRIPTION: Composite: Creates a yellow rectangular region at (133, 32) spanning 63 by 36 pixels then Renders a green disk with center (200, 130) and radius 52.
; PLAN: r0=133(x), r1=32(y), r2=63(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x), r6=130(y), r7=52(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 133
LDI r1, 32
LDI r2, 63
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 130
LDI r7, 52
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
