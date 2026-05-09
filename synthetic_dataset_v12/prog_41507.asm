; DESCRIPTION: Renders a yellow box of size 99x97 starting at (41, 94).
; PLAN: r0=41(x), r1=94(y), r2=99(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 94
LDI r2, 99
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
