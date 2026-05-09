; DESCRIPTION: Composite: Sets a single cyan pixel at (347, 41) then Renders a blue box of size 57x115 starting at (262, 78).
; PLAN: r0=347(x), r1=41(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=262(x), r6=78(y), r7=57(width), r8=115(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 41
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 262
LDI r6, 78
LDI r7, 57
LDI r8, 115
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
