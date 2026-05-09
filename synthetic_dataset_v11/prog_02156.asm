; DESCRIPTION: Renders a magenta box of size 118x78 starting at (53, 148).
; PLAN: r0=53(x), r1=148(y), r2=118(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 148
LDI r2, 118
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
