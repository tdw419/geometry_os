; DESCRIPTION: Places a blue 78x102 rectangle at position (94, 151).
; PLAN: r0=94(x), r1=151(y), r2=78(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 151
LDI r2, 78
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
