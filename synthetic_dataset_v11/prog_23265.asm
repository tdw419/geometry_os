; DESCRIPTION: Places a magenta 95x36 rectangle at position (105, 58).
; PLAN: r0=105(x), r1=58(y), r2=95(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 58
LDI r2, 95
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
