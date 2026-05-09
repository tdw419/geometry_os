; DESCRIPTION: Places a magenta 29x118 rectangle at position (296, 119).
; PLAN: r0=296(x), r1=119(y), r2=29(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 119
LDI r2, 29
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
