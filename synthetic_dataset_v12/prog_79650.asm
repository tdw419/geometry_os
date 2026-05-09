; DESCRIPTION: Renders a magenta box of size 49x11 starting at (108, 141).
; PLAN: r0=108(x), r1=141(y), r2=49(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 141
LDI r2, 49
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
