; DESCRIPTION: Places a purple 79x76 rectangle at position (237, 97).
; PLAN: r0=237(x), r1=97(y), r2=79(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 97
LDI r2, 79
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
