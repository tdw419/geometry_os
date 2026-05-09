; DESCRIPTION: Composite: Sets a single red pixel at (394, 140) then Renders a red box of size 60x12 starting at (289, 10).
; PLAN: r0=394(x), r1=140(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=289(x), r6=10(y), r7=60(width), r8=12(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 140
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 289
LDI r6, 10
LDI r7, 60
LDI r8, 12
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
