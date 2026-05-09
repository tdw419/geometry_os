; DESCRIPTION: Composite: Places a magenta 83x18 rectangle at position (16, 126) then Creates a green circular shape at (96, 124) with radius 59.
; PLAN: r0=16(x), r1=126(y), r2=83(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=96(x), r6=124(y), r7=59(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 16
LDI r1, 126
LDI r2, 83
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 124
LDI r7, 59
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
