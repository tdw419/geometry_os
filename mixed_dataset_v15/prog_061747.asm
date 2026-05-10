; DESCRIPTION: Renders a magenta box of size 58x100 starting at (134, 142).
; PLAN: r0=134(x), r1=142(y), r2=58(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 142
LDI r2, 58
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
