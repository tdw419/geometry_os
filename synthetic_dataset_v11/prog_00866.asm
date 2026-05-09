; DESCRIPTION: Places a magenta 94x88 rectangle at position (38, 69).
; PLAN: r0=38(x), r1=69(y), r2=94(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 69
LDI r2, 94
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
