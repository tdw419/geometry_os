; DESCRIPTION: Renders a magenta box of size 93x66 starting at (182, 127).
; PLAN: r0=182(x), r1=127(y), r2=93(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 127
LDI r2, 93
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
