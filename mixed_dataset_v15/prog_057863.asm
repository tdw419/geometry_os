; DESCRIPTION: Renders a magenta box of size 75x66 starting at (429, 90).
; PLAN: r0=429(x), r1=90(y), r2=75(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 90
LDI r2, 75
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
