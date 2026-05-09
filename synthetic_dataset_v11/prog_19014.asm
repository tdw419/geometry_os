; DESCRIPTION: Renders a black box of size 33x89 starting at (68, 44).
; PLAN: r0=68(x), r1=44(y), r2=33(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 44
LDI r2, 33
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
