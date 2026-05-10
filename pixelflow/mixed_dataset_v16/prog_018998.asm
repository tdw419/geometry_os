; DESCRIPTION: Composite: Creates a yellow rectangular region at (188, 14) spanning 68 by 42 pixels then Renders a orange disk with center (201, 98) and radius 68.
; PLAN: r0=188(x), r1=14(y), r2=68(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x), r6=98(y), r7=68(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 188
LDI r1, 14
LDI r2, 68
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 98
LDI r7, 68
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
