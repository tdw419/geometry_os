; DESCRIPTION: Places a purple 35x37 rectangle at position (28, 188).
; PLAN: r0=28(x), r1=188(y), r2=35(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 188
LDI r2, 35
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
