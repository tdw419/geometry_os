; DESCRIPTION: Renders a magenta box of size 56x102 starting at (94, 135).
; PLAN: r0=94(x), r1=135(y), r2=56(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 135
LDI r2, 56
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
