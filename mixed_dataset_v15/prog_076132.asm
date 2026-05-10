; DESCRIPTION: Places a purple 112x89 rectangle at position (379, 65).
; PLAN: r0=379(x), r1=65(y), r2=112(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 65
LDI r2, 112
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
