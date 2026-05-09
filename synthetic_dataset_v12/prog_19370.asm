; DESCRIPTION: Renders a cyan box of size 88x97 starting at (41, 81).
; PLAN: r0=41(x), r1=81(y), r2=88(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 81
LDI r2, 88
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
