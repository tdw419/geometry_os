; DESCRIPTION: Renders a magenta box of size 49x44 starting at (24, 34).
; PLAN: r0=24(x), r1=34(y), r2=49(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 34
LDI r2, 49
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
