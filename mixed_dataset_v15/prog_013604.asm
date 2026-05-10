; DESCRIPTION: Places a orange 12x59 box at position (389, 151).
; PLAN: r0=389(x), r1=151(y), r2=12(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 151
LDI r2, 12
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
