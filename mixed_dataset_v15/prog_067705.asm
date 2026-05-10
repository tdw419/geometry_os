; DESCRIPTION: Composite: Places a blue 119x58 rectangle at position (13, 82) then Creates a white circular shape at (290, 33) with radius 18.
; PLAN: r0=13(x), r1=82(y), r2=119(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=290(x), r6=33(y), r7=18(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 13
LDI r1, 82
LDI r2, 119
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 33
LDI r7, 18
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
