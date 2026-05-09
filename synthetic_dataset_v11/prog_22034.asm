; DESCRIPTION: Renders a black box of size 56x28 starting at (189, 18).
; PLAN: r0=189(x), r1=18(y), r2=56(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 18
LDI r2, 56
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
