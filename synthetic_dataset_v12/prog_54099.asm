; DESCRIPTION: Renders a red box of size 13x33 starting at (41, 117).
; PLAN: r0=41(x), r1=117(y), r2=13(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 117
LDI r2, 13
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
