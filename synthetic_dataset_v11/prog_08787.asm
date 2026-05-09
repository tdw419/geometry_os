; DESCRIPTION: Renders a yellow box of size 107x89 starting at (100, 139).
; PLAN: r0=100(x), r1=139(y), r2=107(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 139
LDI r2, 107
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
