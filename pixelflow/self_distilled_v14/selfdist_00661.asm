; DESCRIPTION: Places a white 13x58 box at position (116, 183).
; PLAN: r0=116(x), r1=183(y), r2=13(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 183
LDI r2, 13
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
