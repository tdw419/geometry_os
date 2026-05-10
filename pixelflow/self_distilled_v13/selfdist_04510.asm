; DESCRIPTION: Places a white 81x73 box at position (13, 139).
; PLAN: r0=13(x), r1=139(y), r2=81(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 139
LDI r2, 81
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
