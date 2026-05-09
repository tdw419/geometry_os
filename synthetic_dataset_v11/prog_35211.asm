; DESCRIPTION: Renders a magenta box of size 58x50 starting at (125, 145).
; PLAN: r0=125(x), r1=145(y), r2=58(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 145
LDI r2, 58
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
