; DESCRIPTION: Renders a blue box of size 69x22 starting at (82, 40).
; PLAN: r0=82(x), r1=40(y), r2=69(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 40
LDI r2, 69
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
