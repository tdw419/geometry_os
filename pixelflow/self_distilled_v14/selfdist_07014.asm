; DESCRIPTION: Renders a blue rectangular region spanning 23 by 82 at (382, 121).
; PLAN: r0=382(x), r1=121(y), r2=23(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 121
LDI r2, 23
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
