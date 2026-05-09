; DESCRIPTION: Renders a yellow box of size 84x21 starting at (19, 41).
; PLAN: r0=19(x), r1=41(y), r2=84(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 41
LDI r2, 84
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
