; DESCRIPTION: Places a magenta 55x63 rectangle at position (76, 151).
; PLAN: r0=76(x), r1=151(y), r2=55(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 151
LDI r2, 55
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
