; DESCRIPTION: Renders a magenta box of size 49x79 starting at (152, 66).
; PLAN: r0=152(x), r1=66(y), r2=49(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 66
LDI r2, 49
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
