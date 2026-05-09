; DESCRIPTION: Renders a black box of size 120x28 starting at (88, 156).
; PLAN: r0=88(x), r1=156(y), r2=120(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 156
LDI r2, 120
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
