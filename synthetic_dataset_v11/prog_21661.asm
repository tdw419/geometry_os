; DESCRIPTION: Places a purple 79x78 rectangle at position (8, 60).
; PLAN: r0=8(x), r1=60(y), r2=79(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 60
LDI r2, 79
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
