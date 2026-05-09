; DESCRIPTION: Renders a magenta box of size 26x45 starting at (451, 89).
; PLAN: r0=451(x), r1=89(y), r2=26(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 89
LDI r2, 26
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
