; DESCRIPTION: Places a purple 28x31 box at position (379, 75).
; PLAN: r0=379(x), r1=75(y), r2=28(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 75
LDI r2, 28
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
