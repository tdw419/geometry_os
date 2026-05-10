; DESCRIPTION: Renders a black box of size 90x37 starting at (203, 194).
; PLAN: r0=203(x), r1=194(y), r2=90(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 194
LDI r2, 90
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
