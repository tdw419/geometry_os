; DESCRIPTION: Places a purple 112x30 rectangle at position (134, 133).
; PLAN: r0=134(x), r1=133(y), r2=112(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 133
LDI r2, 112
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
