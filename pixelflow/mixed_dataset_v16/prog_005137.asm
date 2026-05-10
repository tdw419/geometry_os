; DESCRIPTION: Renders a purple box of size 92x43 starting at (340, 88).
; PLAN: r0=340(x), r1=88(y), r2=92(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 88
LDI r2, 92
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
