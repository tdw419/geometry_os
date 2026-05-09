; DESCRIPTION: Composite: Renders a green disk with center (433, 165) and radius 63 then Creates a cyan rectangular region at (191, 23) spanning 108 by 83 pixels.
; PLAN: r0=433(x), r1=165(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=191(x), r6=23(y), r7=108(width), r8=83(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 433
LDI r1, 165
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 191
LDI r6, 23
LDI r7, 108
LDI r8, 83
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
