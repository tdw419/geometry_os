; DESCRIPTION: Places a purple 34x105 rectangle at position (97, 100).
; PLAN: r0=97(x), r1=100(y), r2=34(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 100
LDI r2, 34
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
