; DESCRIPTION: Places a purple 87x14 rectangle at position (25, 56).
; PLAN: r0=25(x), r1=56(y), r2=87(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 56
LDI r2, 87
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
