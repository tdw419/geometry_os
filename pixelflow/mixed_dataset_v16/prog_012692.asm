; DESCRIPTION: Composite: Places a green circle of radius 24 at center (167, 116) then Places a purple 32x14 rectangle at position (448, 214).
; PLAN: r0=167(x), r1=116(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=448(x), r6=214(y), r7=32(width), r8=14(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 116
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 448
LDI r6, 214
LDI r7, 32
LDI r8, 14
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
