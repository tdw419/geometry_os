; DESCRIPTION: Composite: Places a yellow 56x57 rectangle at position (453, 125) then Creates a black circular shape at (156, 113) with radius 70.
; PLAN: r0=453(x), r1=125(y), r2=56(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x), r6=113(y), r7=70(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 453
LDI r1, 125
LDI r2, 56
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 113
LDI r7, 70
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
