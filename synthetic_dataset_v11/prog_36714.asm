; DESCRIPTION: Renders a red box of size 11x53 starting at (51, 159).
; PLAN: r0=51(x), r1=159(y), r2=11(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 159
LDI r2, 11
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
