; DESCRIPTION: Places a magenta 102x114 rectangle at position (138, 64).
; PLAN: r0=138(x), r1=64(y), r2=102(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 64
LDI r2, 102
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
