; DESCRIPTION: Places a purple 66x87 rectangle at position (381, 139).
; PLAN: r0=381(x), r1=139(y), r2=66(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 139
LDI r2, 66
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
