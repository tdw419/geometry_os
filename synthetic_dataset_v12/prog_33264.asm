; DESCRIPTION: Composite: Places a purple circle of radius 45 at center (173, 107) then Places a green 103x11 rectangle at position (358, 183).
; PLAN: r0=173(x), r1=107(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=358(x), r6=183(y), r7=103(width), r8=11(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 173
LDI r1, 107
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 358
LDI r6, 183
LDI r7, 103
LDI r8, 11
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
