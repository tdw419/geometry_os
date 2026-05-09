; DESCRIPTION: Places a purple 87x45 rectangle at position (282, 116).
; PLAN: r0=282(x), r1=116(y), r2=87(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 116
LDI r2, 87
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
