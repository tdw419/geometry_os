; DESCRIPTION: Renders a yellow box of size 114x90 starting at (30, 88).
; PLAN: r0=30(x), r1=88(y), r2=114(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 88
LDI r2, 114
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
