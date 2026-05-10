; DESCRIPTION: Renders a white rectangular region spanning 90 by 30 at (225, 185).
; PLAN: r0=225(x), r1=185(y), r2=90(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 185
LDI r2, 90
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
