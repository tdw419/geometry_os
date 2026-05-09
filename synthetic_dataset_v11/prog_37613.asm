; DESCRIPTION: Renders a yellow box of size 68x78 starting at (9, 71).
; PLAN: r0=9(x), r1=71(y), r2=68(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 71
LDI r2, 68
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
