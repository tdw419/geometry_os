; DESCRIPTION: Renders a green box of size 41x107 starting at (117, 86).
; PLAN: r0=117(x), r1=86(y), r2=41(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 86
LDI r2, 41
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
