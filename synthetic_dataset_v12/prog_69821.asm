; DESCRIPTION: Renders a magenta box of size 12x89 starting at (134, 53).
; PLAN: r0=134(x), r1=53(y), r2=12(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 53
LDI r2, 12
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
