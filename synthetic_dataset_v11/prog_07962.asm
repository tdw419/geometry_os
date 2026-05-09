; DESCRIPTION: Places a magenta 11x29 rectangle at position (22, 209).
; PLAN: r0=22(x), r1=209(y), r2=11(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 209
LDI r2, 11
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
