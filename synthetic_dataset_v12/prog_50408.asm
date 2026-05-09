; DESCRIPTION: Composite: Places a purple 30x103 rectangle at position (40, 93) then Creates a cyan circular shape at (461, 213) with radius 36.
; PLAN: r0=40(x), r1=93(y), r2=30(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=461(x), r6=213(y), r7=36(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 40
LDI r1, 93
LDI r2, 30
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 213
LDI r7, 36
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
