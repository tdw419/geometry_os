; DESCRIPTION: Renders a magenta box of size 111x14 starting at (89, 211).
; PLAN: r0=89(x), r1=211(y), r2=111(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 211
LDI r2, 111
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
