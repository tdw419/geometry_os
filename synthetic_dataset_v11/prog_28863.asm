; DESCRIPTION: Places a magenta 40x88 rectangle at position (129, 87).
; PLAN: r0=129(x), r1=87(y), r2=40(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 87
LDI r2, 40
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
