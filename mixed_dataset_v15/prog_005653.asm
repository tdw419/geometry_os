; DESCRIPTION: Renders a black box of size 107x76 starting at (3, 34).
; PLAN: r0=3(x), r1=34(y), r2=107(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 34
LDI r2, 107
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
