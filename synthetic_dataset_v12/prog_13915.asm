; DESCRIPTION: Places a magenta 76x118 rectangle at position (40, 62).
; PLAN: r0=40(x), r1=62(y), r2=76(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 62
LDI r2, 76
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
