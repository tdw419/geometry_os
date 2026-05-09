; DESCRIPTION: Renders a black box of size 89x73 starting at (184, 5).
; PLAN: r0=184(x), r1=5(y), r2=89(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 5
LDI r2, 89
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
