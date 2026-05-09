; DESCRIPTION: Renders a purple box of size 79x88 starting at (122, 59).
; PLAN: r0=122(x), r1=59(y), r2=79(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 59
LDI r2, 79
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
