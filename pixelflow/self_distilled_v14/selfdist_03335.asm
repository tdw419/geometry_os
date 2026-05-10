; DESCRIPTION: Renders a green rectangular region spanning 41 by 102 at (282, 70).
; PLAN: r0=282(x), r1=70(y), r2=41(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 70
LDI r2, 41
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
