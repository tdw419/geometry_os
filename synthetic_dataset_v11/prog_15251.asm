; DESCRIPTION: Renders a magenta box of size 85x63 starting at (114, 43).
; PLAN: r0=114(x), r1=43(y), r2=85(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 43
LDI r2, 85
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
