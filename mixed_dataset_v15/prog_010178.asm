; DESCRIPTION: Composite: Places a cyan 46x47 rectangle at position (52, 75) then Creates a magenta circular shape at (324, 121) with radius 45.
; PLAN: r0=52(x), r1=75(y), r2=46(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=324(x), r6=121(y), r7=45(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 52
LDI r1, 75
LDI r2, 46
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 121
LDI r7, 45
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
