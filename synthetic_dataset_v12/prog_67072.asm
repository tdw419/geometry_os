; DESCRIPTION: Renders a green box of size 54x41 starting at (121, 68).
; PLAN: r0=121(x), r1=68(y), r2=54(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 68
LDI r2, 54
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
