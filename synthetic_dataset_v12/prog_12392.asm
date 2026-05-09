; DESCRIPTION: Renders a blue box of size 39x17 starting at (212, 203).
; PLAN: r0=212(x), r1=203(y), r2=39(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 203
LDI r2, 39
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
