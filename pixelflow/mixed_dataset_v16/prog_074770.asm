; DESCRIPTION: Renders a yellow box of size 38x41 starting at (38, 93).
; PLAN: r0=38(x), r1=93(y), r2=38(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 93
LDI r2, 38
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
