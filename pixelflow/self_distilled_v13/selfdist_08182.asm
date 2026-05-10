; DESCRIPTION: Renders a white rectangular region spanning 75 by 83 at (378, 20).
; PLAN: r0=378(x), r1=20(y), r2=75(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 20
LDI r2, 75
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
