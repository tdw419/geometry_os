; DESCRIPTION: Renders a yellow rectangular region spanning 89 by 84 at (362, 50).
; PLAN: r0=362(x), r1=50(y), r2=89(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 50
LDI r2, 89
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
