; DESCRIPTION: Composite: Places a magenta 115x105 rectangle at position (149, 71) then Creates a cyan circular shape at (211, 113) with radius 73.
; PLAN: r0=149(x), r1=71(y), r2=115(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=211(x), r6=113(y), r7=73(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 149
LDI r1, 71
LDI r2, 115
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 113
LDI r7, 73
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
