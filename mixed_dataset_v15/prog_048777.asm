; DESCRIPTION: Renders a magenta box of size 74x102 starting at (28, 13).
; PLAN: r0=28(x), r1=13(y), r2=74(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 13
LDI r2, 74
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
