; DESCRIPTION: Renders a magenta box of size 58x31 starting at (26, 90).
; PLAN: r0=26(x), r1=90(y), r2=58(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 90
LDI r2, 58
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
