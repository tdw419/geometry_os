; DESCRIPTION: Renders a yellow box of size 69x61 starting at (338, 115).
; PLAN: r0=338(x), r1=115(y), r2=69(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 115
LDI r2, 69
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
