; DESCRIPTION: Renders a red box of size 106x41 starting at (49, 187).
; PLAN: r0=49(x), r1=187(y), r2=106(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 187
LDI r2, 106
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
