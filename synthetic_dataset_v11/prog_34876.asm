; DESCRIPTION: Renders a magenta box of size 115x96 starting at (50, 69).
; PLAN: r0=50(x), r1=69(y), r2=115(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 69
LDI r2, 115
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
