; DESCRIPTION: Renders a magenta box of size 74x100 starting at (182, 3).
; PLAN: r0=182(x), r1=3(y), r2=74(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 3
LDI r2, 74
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
