; DESCRIPTION: Renders a red box of size 41x24 starting at (50, 138).
; PLAN: r0=50(x), r1=138(y), r2=41(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 138
LDI r2, 41
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
