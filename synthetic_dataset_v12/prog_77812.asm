; DESCRIPTION: Renders a magenta box of size 58x36 starting at (306, 138).
; PLAN: r0=306(x), r1=138(y), r2=58(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 138
LDI r2, 58
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
