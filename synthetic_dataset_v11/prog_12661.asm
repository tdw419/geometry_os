; DESCRIPTION: Places a magenta 101x108 rectangle at position (36, 114).
; PLAN: r0=36(x), r1=114(y), r2=101(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 114
LDI r2, 101
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
