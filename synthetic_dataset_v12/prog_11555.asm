; DESCRIPTION: Composite: Renders a yellow disk with center (331, 52) and radius 40 then Creates a yellow rectangular region at (28, 26) spanning 31 by 48 pixels.
; PLAN: r0=331(x), r1=52(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=28(x), r6=26(y), r7=31(width), r8=48(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 331
LDI r1, 52
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 28
LDI r6, 26
LDI r7, 31
LDI r8, 48
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
