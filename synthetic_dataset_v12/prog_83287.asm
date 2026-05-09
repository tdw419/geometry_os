; DESCRIPTION: Composite: Places a purple circle of radius 49 at center (348, 177) then Places a green 66x16 rectangle at position (435, 53).
; PLAN: r0=348(x), r1=177(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x), r6=53(y), r7=66(width), r8=16(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 348
LDI r1, 177
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 53
LDI r7, 66
LDI r8, 16
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
