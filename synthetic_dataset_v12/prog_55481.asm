; DESCRIPTION: Composite: Creates a orange rectangular region at (231, 126) spanning 86 by 43 pixels then Draws a purple circle centered at (275, 66) with radius 63.
; PLAN: r0=231(x), r1=126(y), r2=86(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=66(y), r7=63(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 231
LDI r1, 126
LDI r2, 86
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 66
LDI r7, 63
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
