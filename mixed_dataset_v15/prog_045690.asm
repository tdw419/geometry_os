; DESCRIPTION: Places a orange 19x119 box at position (269, 151).
; PLAN: r0=269(x), r1=151(y), r2=19(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 151
LDI r2, 19
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
