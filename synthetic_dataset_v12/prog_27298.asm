; DESCRIPTION: Renders a magenta box of size 20x62 starting at (319, 159).
; PLAN: r0=319(x), r1=159(y), r2=20(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 159
LDI r2, 20
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
