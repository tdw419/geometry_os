; DESCRIPTION: Places a purple 10x87 rectangle at position (139, 4).
; PLAN: r0=139(x), r1=4(y), r2=10(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 4
LDI r2, 10
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
