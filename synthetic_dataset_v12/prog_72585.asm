; DESCRIPTION: Renders a magenta box of size 25x119 starting at (362, 47).
; PLAN: r0=362(x), r1=47(y), r2=25(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 47
LDI r2, 25
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
