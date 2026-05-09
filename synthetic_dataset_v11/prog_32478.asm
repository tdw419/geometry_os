; DESCRIPTION: Renders a yellow box of size 108x59 starting at (41, 68).
; PLAN: r0=41(x), r1=68(y), r2=108(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 68
LDI r2, 108
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
