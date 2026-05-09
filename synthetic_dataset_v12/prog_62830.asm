; DESCRIPTION: Renders a purple box of size 69x116 starting at (12, 78).
; PLAN: r0=12(x), r1=78(y), r2=69(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 78
LDI r2, 69
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
