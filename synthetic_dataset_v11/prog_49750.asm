; DESCRIPTION: Renders a blue box of size 46x69 starting at (45, 19).
; PLAN: r0=45(x), r1=19(y), r2=46(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 19
LDI r2, 46
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
