; DESCRIPTION: Renders a red box of size 80x41 starting at (136, 86).
; PLAN: r0=136(x), r1=86(y), r2=80(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 86
LDI r2, 80
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
