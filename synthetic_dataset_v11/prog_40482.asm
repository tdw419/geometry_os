; DESCRIPTION: Renders a yellow box of size 14x41 starting at (24, 7).
; PLAN: r0=24(x), r1=7(y), r2=14(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 7
LDI r2, 14
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
