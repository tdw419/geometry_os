; DESCRIPTION: Renders a blue box of size 108x69 starting at (38, 92).
; PLAN: r0=38(x), r1=92(y), r2=108(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 92
LDI r2, 108
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
