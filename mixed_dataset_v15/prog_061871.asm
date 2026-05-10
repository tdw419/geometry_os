; DESCRIPTION: Renders a magenta box of size 23x92 starting at (70, 114).
; PLAN: r0=70(x), r1=114(y), r2=23(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 114
LDI r2, 23
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
