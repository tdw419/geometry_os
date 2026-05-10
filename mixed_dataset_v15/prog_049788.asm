; DESCRIPTION: Places a magenta 118x43 rectangle at position (336, 155).
; PLAN: r0=336(x), r1=155(y), r2=118(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 155
LDI r2, 118
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
