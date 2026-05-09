; DESCRIPTION: Renders a black box of size 10x88 starting at (174, 133).
; PLAN: r0=174(x), r1=133(y), r2=10(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 133
LDI r2, 10
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
