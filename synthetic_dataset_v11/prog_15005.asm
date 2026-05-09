; DESCRIPTION: Places a purple 88x79 rectangle at position (30, 77).
; PLAN: r0=30(x), r1=77(y), r2=88(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 77
LDI r2, 88
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
