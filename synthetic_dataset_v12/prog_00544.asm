; DESCRIPTION: Renders a black box of size 61x18 starting at (203, 85).
; PLAN: r0=203(x), r1=85(y), r2=61(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 85
LDI r2, 61
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
