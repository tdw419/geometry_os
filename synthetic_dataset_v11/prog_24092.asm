; DESCRIPTION: Renders a black box of size 23x91 starting at (223, 87).
; PLAN: r0=223(x), r1=87(y), r2=23(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 87
LDI r2, 23
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
