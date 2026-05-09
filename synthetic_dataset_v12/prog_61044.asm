; DESCRIPTION: Renders a magenta box of size 119x102 starting at (101, 113).
; PLAN: r0=101(x), r1=113(y), r2=119(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 113
LDI r2, 119
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
