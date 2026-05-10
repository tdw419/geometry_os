; DESCRIPTION: Composite: Sets a single green pixel at (289, 164) then Renders a white box of size 12x117 starting at (390, 8).
; PLAN: r0=289(x), r1=164(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=390(x), r6=8(y), r7=12(width), r8=117(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 164
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 390
LDI r6, 8
LDI r7, 12
LDI r8, 117
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
