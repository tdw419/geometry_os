; DESCRIPTION: Places a orange 92x108 box at position (172, 151).
; PLAN: r0=172(x), r1=151(y), r2=92(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 151
LDI r2, 92
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
