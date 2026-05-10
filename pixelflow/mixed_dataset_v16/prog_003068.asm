; DESCRIPTION: Places a magenta 46x118 rectangle at position (58, 108).
; PLAN: r0=58(x), r1=108(y), r2=46(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 108
LDI r2, 46
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
