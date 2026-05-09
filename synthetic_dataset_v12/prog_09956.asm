; DESCRIPTION: Renders a black box of size 89x63 starting at (204, 44).
; PLAN: r0=204(x), r1=44(y), r2=89(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 44
LDI r2, 89
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
