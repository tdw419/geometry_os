; DESCRIPTION: Places a purple 112x101 box at position (344, 5).
; PLAN: r0=344(x), r1=5(y), r2=112(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 5
LDI r2, 112
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
