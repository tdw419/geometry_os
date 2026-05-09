; DESCRIPTION: Renders a yellow box of size 69x61 starting at (88, 95).
; PLAN: r0=88(x), r1=95(y), r2=69(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 95
LDI r2, 69
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
