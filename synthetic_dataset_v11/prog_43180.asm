; DESCRIPTION: Renders a blue box of size 41x80 starting at (25, 40).
; PLAN: r0=25(x), r1=40(y), r2=41(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 40
LDI r2, 41
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
