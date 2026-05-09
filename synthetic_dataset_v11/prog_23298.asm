; DESCRIPTION: Renders a yellow box of size 41x31 starting at (86, 38).
; PLAN: r0=86(x), r1=38(y), r2=41(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 38
LDI r2, 41
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
