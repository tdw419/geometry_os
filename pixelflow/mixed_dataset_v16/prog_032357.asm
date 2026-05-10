; DESCRIPTION: Renders a black box of size 89x26 starting at (18, 95).
; PLAN: r0=18(x), r1=95(y), r2=89(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 95
LDI r2, 89
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
