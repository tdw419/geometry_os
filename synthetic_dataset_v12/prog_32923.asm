; DESCRIPTION: Composite: Renders a orange disk with center (402, 124) and radius 71 then Creates a green rectangular region at (301, 65) spanning 73 by 88 pixels.
; PLAN: r0=402(x), r1=124(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x), r6=65(y), r7=73(width), r8=88(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 124
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 65
LDI r7, 73
LDI r8, 88
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
