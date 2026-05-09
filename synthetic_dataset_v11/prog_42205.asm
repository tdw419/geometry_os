; DESCRIPTION: Renders a black box of size 95x106 starting at (21, 56).
; PLAN: r0=21(x), r1=56(y), r2=95(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 56
LDI r2, 95
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
