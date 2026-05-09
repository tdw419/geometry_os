; DESCRIPTION: Renders a red box of size 59x70 starting at (41, 85).
; PLAN: r0=41(x), r1=85(y), r2=59(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 85
LDI r2, 59
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
