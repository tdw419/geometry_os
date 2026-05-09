; DESCRIPTION: Renders a red box of size 41x89 starting at (460, 27).
; PLAN: r0=460(x), r1=27(y), r2=41(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 27
LDI r2, 41
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
