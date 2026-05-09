; DESCRIPTION: Renders a white box of size 69x14 starting at (100, 95).
; PLAN: r0=100(x), r1=95(y), r2=69(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 95
LDI r2, 69
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
