; DESCRIPTION: Renders a white rectangular region spanning 119 by 34 at (120, 133).
; PLAN: r0=120(x), r1=133(y), r2=119(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 133
LDI r2, 119
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
