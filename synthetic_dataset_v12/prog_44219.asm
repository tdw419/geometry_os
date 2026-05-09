; DESCRIPTION: Renders a white box of size 59x69 starting at (41, 80).
; PLAN: r0=41(x), r1=80(y), r2=59(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 80
LDI r2, 59
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
