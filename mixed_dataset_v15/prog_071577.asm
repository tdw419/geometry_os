; DESCRIPTION: Composite: Creates a blue circular shape at (210, 177) with radius 10 then Places a cyan 43x81 rectangle at position (297, 136).
; PLAN: r0=210(x), r1=177(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=297(x), r6=136(y), r7=43(width), r8=81(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 210
LDI r1, 177
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 297
LDI r6, 136
LDI r7, 43
LDI r8, 81
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
