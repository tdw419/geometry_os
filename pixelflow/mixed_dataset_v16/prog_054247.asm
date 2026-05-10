; DESCRIPTION: Renders a purple box of size 37x111 starting at (343, 109).
; PLAN: r0=343(x), r1=109(y), r2=37(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 109
LDI r2, 37
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
