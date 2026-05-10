; DESCRIPTION: Places a purple 70x96 box at position (35, 151).
; PLAN: r0=35(x), r1=151(y), r2=70(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 151
LDI r2, 70
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
