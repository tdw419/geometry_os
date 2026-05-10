; DESCRIPTION: Composite: Places a black 106x30 rectangle at position (13, 163) then Creates a green circular shape at (420, 84) with radius 63.
; PLAN: r0=13(x), r1=163(y), r2=106(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=420(x), r6=84(y), r7=63(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 13
LDI r1, 163
LDI r2, 106
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 84
LDI r7, 63
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
