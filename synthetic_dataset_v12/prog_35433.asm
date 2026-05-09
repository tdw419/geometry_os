; DESCRIPTION: Renders a yellow box of size 41x23 starting at (4, 230).
; PLAN: r0=4(x), r1=230(y), r2=41(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 230
LDI r2, 41
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
