; DESCRIPTION: Renders a cyan box of size 46x78 starting at (105, 41).
; PLAN: r0=105(x), r1=41(y), r2=46(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 41
LDI r2, 46
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
