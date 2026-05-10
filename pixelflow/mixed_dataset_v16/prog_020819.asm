; DESCRIPTION: Composite: Sets a single yellow pixel at (51, 12) then Renders a white box of size 96x11 starting at (12, 26).
; PLAN: r0=51(x), r1=12(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=12(x), r6=26(y), r7=96(width), r8=11(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 51
LDI r1, 12
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 12
LDI r6, 26
LDI r7, 96
LDI r8, 11
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
