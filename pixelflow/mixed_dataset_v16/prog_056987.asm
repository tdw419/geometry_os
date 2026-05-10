; DESCRIPTION: Places a magenta 114x59 rectangle at position (64, 88).
; PLAN: r0=64(x), r1=88(y), r2=114(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 88
LDI r2, 114
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
