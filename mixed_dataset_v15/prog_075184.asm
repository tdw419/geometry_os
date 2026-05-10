; DESCRIPTION: Places a magenta 66x21 box at position (255, 151).
; PLAN: r0=255(x), r1=151(y), r2=66(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 151
LDI r2, 66
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
