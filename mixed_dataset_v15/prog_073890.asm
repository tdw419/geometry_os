; DESCRIPTION: Renders a magenta box of size 35x80 starting at (452, 57).
; PLAN: r0=452(x), r1=57(y), r2=35(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 57
LDI r2, 35
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
