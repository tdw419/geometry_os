; DESCRIPTION: Places a purple 112x56 rectangle at position (22, 61).
; PLAN: r0=22(x), r1=61(y), r2=112(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 61
LDI r2, 112
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
