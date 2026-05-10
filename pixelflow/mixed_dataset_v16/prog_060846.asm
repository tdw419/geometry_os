; DESCRIPTION: Renders a white rectangular region spanning 60 by 111 at (58, 119).
; PLAN: r0=58(x), r1=119(y), r2=60(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 119
LDI r2, 60
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
