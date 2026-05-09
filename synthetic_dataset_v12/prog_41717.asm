; DESCRIPTION: Renders a red box of size 32x46 starting at (112, 41).
; PLAN: r0=112(x), r1=41(y), r2=32(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 41
LDI r2, 32
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
