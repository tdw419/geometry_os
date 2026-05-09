; DESCRIPTION: Places a magenta 101x88 rectangle at position (225, 32).
; PLAN: r0=225(x), r1=32(y), r2=101(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 32
LDI r2, 101
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
