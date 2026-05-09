; DESCRIPTION: Renders a magenta box of size 83x89 starting at (393, 11).
; PLAN: r0=393(x), r1=11(y), r2=83(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 11
LDI r2, 83
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
