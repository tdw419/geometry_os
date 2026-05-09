; DESCRIPTION: Renders a blue box of size 33x46 starting at (88, 50).
; PLAN: r0=88(x), r1=50(y), r2=33(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 50
LDI r2, 33
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
