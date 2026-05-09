; DESCRIPTION: Renders a red box of size 41x120 starting at (125, 6).
; PLAN: r0=125(x), r1=6(y), r2=41(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 6
LDI r2, 41
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
