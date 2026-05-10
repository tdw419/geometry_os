; DESCRIPTION: Renders a white rectangular region spanning 95 by 20 at (139, 110).
; PLAN: r0=139(x), r1=110(y), r2=95(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 110
LDI r2, 95
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
