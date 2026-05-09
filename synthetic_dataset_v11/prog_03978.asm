; DESCRIPTION: Renders a blue box of size 28x43 starting at (204, 205).
; PLAN: r0=204(x), r1=205(y), r2=28(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 205
LDI r2, 28
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
