; DESCRIPTION: Renders a purple box of size 69x69 starting at (172, 95).
; PLAN: r0=172(x), r1=95(y), r2=69(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 95
LDI r2, 69
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
