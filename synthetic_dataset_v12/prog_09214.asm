; DESCRIPTION: Places a red 23x19 rectangle at position (364, 151).
; PLAN: r0=364(x), r1=151(y), r2=23(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 151
LDI r2, 23
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
