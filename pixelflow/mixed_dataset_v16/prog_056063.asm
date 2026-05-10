; DESCRIPTION: Renders a black box of size 89x14 starting at (152, 238).
; PLAN: r0=152(x), r1=238(y), r2=89(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 238
LDI r2, 89
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
