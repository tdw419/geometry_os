; DESCRIPTION: Renders a yellow box of size 41x87 starting at (91, 19).
; PLAN: r0=91(x), r1=19(y), r2=41(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 19
LDI r2, 41
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
