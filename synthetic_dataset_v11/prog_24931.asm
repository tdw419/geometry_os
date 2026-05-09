; DESCRIPTION: Renders a red box of size 11x43 starting at (203, 87).
; PLAN: r0=203(x), r1=87(y), r2=11(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 87
LDI r2, 11
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
