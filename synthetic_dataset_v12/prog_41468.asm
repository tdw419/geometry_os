; DESCRIPTION: Composite: Places a yellow 108x109 rectangle at position (241, 52) then Creates a black circular shape at (99, 79) with radius 63.
; PLAN: r0=241(x), r1=52(y), r2=108(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=99(x), r6=79(y), r7=63(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 241
LDI r1, 52
LDI r2, 108
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 79
LDI r7, 63
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
