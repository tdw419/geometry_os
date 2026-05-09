; DESCRIPTION: Renders a green box of size 43x69 starting at (452, 153).
; PLAN: r0=452(x), r1=153(y), r2=43(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 153
LDI r2, 43
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
