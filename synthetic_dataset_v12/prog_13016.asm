; DESCRIPTION: Renders a black box of size 56x36 starting at (334, 76).
; PLAN: r0=334(x), r1=76(y), r2=56(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 76
LDI r2, 56
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
