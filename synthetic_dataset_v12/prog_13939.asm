; DESCRIPTION: Places a purple 110x101 rectangle at position (399, 103).
; PLAN: r0=399(x), r1=103(y), r2=110(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 103
LDI r2, 110
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
