; DESCRIPTION: Renders a black box of size 10x59 starting at (134, 147).
; PLAN: r0=134(x), r1=147(y), r2=10(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 147
LDI r2, 10
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
