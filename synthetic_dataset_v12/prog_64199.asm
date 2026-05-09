; DESCRIPTION: Composite: Renders a red disk with center (266, 188) and radius 65 then Creates a orange rectangular region at (354, 8) spanning 18 by 13 pixels.
; PLAN: r0=266(x), r1=188(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=354(x), r6=8(y), r7=18(width), r8=13(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 266
LDI r1, 188
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 354
LDI r6, 8
LDI r7, 18
LDI r8, 13
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
