; DESCRIPTION: Renders a black box of size 12x89 starting at (250, 46).
; PLAN: r0=250(x), r1=46(y), r2=12(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 46
LDI r2, 12
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
