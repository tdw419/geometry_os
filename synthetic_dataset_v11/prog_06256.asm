; DESCRIPTION: Renders a magenta box of size 18x108 starting at (6, 73).
; PLAN: r0=6(x), r1=73(y), r2=18(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 73
LDI r2, 18
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
