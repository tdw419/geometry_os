; DESCRIPTION: Renders a black box of size 75x41 starting at (430, 44).
; PLAN: r0=430(x), r1=44(y), r2=75(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 44
LDI r2, 75
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
