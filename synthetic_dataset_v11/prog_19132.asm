; DESCRIPTION: Renders a magenta box of size 49x62 starting at (164, 99).
; PLAN: r0=164(x), r1=99(y), r2=49(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 99
LDI r2, 49
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
