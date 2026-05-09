; DESCRIPTION: Renders a magenta box of size 102x78 starting at (101, 133).
; PLAN: r0=101(x), r1=133(y), r2=102(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 133
LDI r2, 102
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
