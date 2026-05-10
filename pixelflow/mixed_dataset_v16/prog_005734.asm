; DESCRIPTION: Renders a magenta box of size 115x117 starting at (170, 28).
; PLAN: r0=170(x), r1=28(y), r2=115(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 28
LDI r2, 115
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
