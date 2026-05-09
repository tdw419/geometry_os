; DESCRIPTION: Places a magenta 58x98 rectangle at position (88, 122).
; PLAN: r0=88(x), r1=122(y), r2=58(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 122
LDI r2, 58
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
