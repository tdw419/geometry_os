; DESCRIPTION: Renders a purple box of size 69x46 starting at (18, 0).
; PLAN: r0=18(x), r1=0(y), r2=69(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 0
LDI r2, 69
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
