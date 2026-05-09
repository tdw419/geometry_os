; DESCRIPTION: Renders a red box of size 41x117 starting at (139, 126).
; PLAN: r0=139(x), r1=126(y), r2=41(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 126
LDI r2, 41
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
