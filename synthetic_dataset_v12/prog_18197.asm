; DESCRIPTION: Renders a black box of size 63x11 starting at (90, 203).
; PLAN: r0=90(x), r1=203(y), r2=63(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 203
LDI r2, 63
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
