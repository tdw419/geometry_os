; DESCRIPTION: Renders a purple box of size 69x20 starting at (169, 108).
; PLAN: r0=169(x), r1=108(y), r2=69(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 108
LDI r2, 69
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
