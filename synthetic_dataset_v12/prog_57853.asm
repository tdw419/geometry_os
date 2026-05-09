; DESCRIPTION: Places a magenta 91x80 rectangle at position (223, 151).
; PLAN: r0=223(x), r1=151(y), r2=91(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 151
LDI r2, 91
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
