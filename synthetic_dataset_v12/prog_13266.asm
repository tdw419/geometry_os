; DESCRIPTION: Renders a yellow box of size 109x22 starting at (384, 41).
; PLAN: r0=384(x), r1=41(y), r2=109(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 41
LDI r2, 109
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
