; DESCRIPTION: Renders a magenta box of size 71x101 starting at (125, 39).
; PLAN: r0=125(x), r1=39(y), r2=71(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 39
LDI r2, 71
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
