; DESCRIPTION: Places a purple 30x11 rectangle at position (282, 79).
; PLAN: r0=282(x), r1=79(y), r2=30(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 79
LDI r2, 30
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
