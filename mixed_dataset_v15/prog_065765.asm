; DESCRIPTION: Composite: Places a black 48x83 rectangle at position (109, 147) then Creates a cyan circular shape at (153, 163) with radius 50.
; PLAN: r0=109(x), r1=147(y), r2=48(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=153(x), r6=163(y), r7=50(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 109
LDI r1, 147
LDI r2, 48
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 163
LDI r7, 50
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
