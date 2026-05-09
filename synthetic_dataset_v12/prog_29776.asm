; DESCRIPTION: Renders a magenta box of size 25x79 starting at (430, 158).
; PLAN: r0=430(x), r1=158(y), r2=25(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 158
LDI r2, 25
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
