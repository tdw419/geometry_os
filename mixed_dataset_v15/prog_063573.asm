; DESCRIPTION: Composite: Sets a single red pixel at (60, 41) then Renders a white line between points (504, 36) and (491, 155).
; PLAN: r0=60(x), r1=41(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=504(x1), r6=36(y1), r7=491(x2), r8=155(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 60
LDI r1, 41
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 504
LDI r6, 36
LDI r7, 491
LDI r8, 155
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
