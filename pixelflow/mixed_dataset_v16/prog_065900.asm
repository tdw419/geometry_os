; DESCRIPTION: Renders a black box of size 52x56 starting at (135, 122).
; PLAN: r0=135(x), r1=122(y), r2=52(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 122
LDI r2, 52
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
