; DESCRIPTION: Places a black 16x37 rectangle at position (297, 183).
; PLAN: r0=297(x), r1=183(y), r2=16(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 183
LDI r2, 16
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
