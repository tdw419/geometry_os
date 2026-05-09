; DESCRIPTION: Places a purple 87x20 rectangle at position (87, 116).
; PLAN: r0=87(x), r1=116(y), r2=87(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 116
LDI r2, 87
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
