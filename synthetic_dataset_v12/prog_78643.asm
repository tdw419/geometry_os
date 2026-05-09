; DESCRIPTION: Places a white 97x12 rectangle at position (376, 183).
; PLAN: r0=376(x), r1=183(y), r2=97(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 183
LDI r2, 97
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
