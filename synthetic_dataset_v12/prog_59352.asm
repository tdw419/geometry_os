; DESCRIPTION: Renders a yellow box of size 78x19 starting at (34, 43).
; PLAN: r0=34(x), r1=43(y), r2=78(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 43
LDI r2, 78
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
