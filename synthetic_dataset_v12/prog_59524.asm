; DESCRIPTION: Renders a magenta box of size 26x17 starting at (292, 52).
; PLAN: r0=292(x), r1=52(y), r2=26(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 52
LDI r2, 26
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
