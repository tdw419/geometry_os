; DESCRIPTION: Renders a blue rectangular region spanning 30 by 24 at (339, 82).
; PLAN: r0=339(x), r1=82(y), r2=30(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 82
LDI r2, 30
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
