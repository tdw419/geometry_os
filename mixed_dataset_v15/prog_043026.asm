; DESCRIPTION: Renders a white box of size 45x45 starting at (378, 28).
; PLAN: r0=378(x), r1=28(y), r2=45(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 28
LDI r2, 45
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
