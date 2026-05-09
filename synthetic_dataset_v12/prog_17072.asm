; DESCRIPTION: Renders a black box of size 88x11 starting at (80, 135).
; PLAN: r0=80(x), r1=135(y), r2=88(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 135
LDI r2, 88
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
