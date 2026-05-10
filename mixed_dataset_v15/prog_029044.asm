; DESCRIPTION: Renders a blue rectangular region spanning 89 by 45 at (63, 65).
; PLAN: r0=63(x), r1=65(y), r2=89(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 65
LDI r2, 89
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
