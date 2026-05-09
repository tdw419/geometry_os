; DESCRIPTION: Renders a red box of size 69x111 starting at (41, 133).
; PLAN: r0=41(x), r1=133(y), r2=69(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 133
LDI r2, 69
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
