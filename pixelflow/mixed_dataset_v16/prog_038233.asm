; DESCRIPTION: Renders a magenta box of size 114x66 starting at (74, 38).
; PLAN: r0=74(x), r1=38(y), r2=114(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 38
LDI r2, 114
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
