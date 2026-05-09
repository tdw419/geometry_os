; DESCRIPTION: Renders a magenta box of size 19x62 starting at (89, 59).
; PLAN: r0=89(x), r1=59(y), r2=19(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 59
LDI r2, 19
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
