; DESCRIPTION: Renders a magenta box of size 74x43 starting at (259, 171).
; PLAN: r0=259(x), r1=171(y), r2=74(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 171
LDI r2, 74
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
