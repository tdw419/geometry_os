; DESCRIPTION: Renders a magenta box of size 99x43 starting at (111, 212).
; PLAN: r0=111(x), r1=212(y), r2=99(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 212
LDI r2, 99
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
