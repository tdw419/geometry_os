; DESCRIPTION: Renders a purple box of size 11x71 starting at (198, 88).
; PLAN: r0=198(x), r1=88(y), r2=11(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 88
LDI r2, 11
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
