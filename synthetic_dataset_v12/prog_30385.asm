; DESCRIPTION: Composite: Renders a orange disk with center (269, 167) and radius 65 then Creates a purple rectangular region at (209, 87) spanning 65 by 88 pixels.
; PLAN: r0=269(x), r1=167(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=209(x), r6=87(y), r7=65(width), r8=88(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 167
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 209
LDI r6, 87
LDI r7, 65
LDI r8, 88
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
