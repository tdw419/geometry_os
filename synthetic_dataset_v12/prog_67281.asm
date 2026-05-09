; DESCRIPTION: Renders a black box of size 29x95 starting at (203, 54).
; PLAN: r0=203(x), r1=54(y), r2=29(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 54
LDI r2, 29
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
