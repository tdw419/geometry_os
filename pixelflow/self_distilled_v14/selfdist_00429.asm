; DESCRIPTION: Renders a red rectangular region spanning 58 by 69 at (382, 94).
; PLAN: r0=382(x), r1=94(y), r2=58(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 94
LDI r2, 58
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
