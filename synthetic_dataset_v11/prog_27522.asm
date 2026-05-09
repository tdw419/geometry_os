; DESCRIPTION: Renders a magenta box of size 38x106 starting at (44, 6).
; PLAN: r0=44(x), r1=6(y), r2=38(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 6
LDI r2, 38
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
