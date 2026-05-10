; DESCRIPTION: Renders a yellow rectangular region spanning 47 by 72 at (385, 93).
; PLAN: r0=385(x), r1=93(y), r2=47(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 93
LDI r2, 47
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
