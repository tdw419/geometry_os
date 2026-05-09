; DESCRIPTION: Composite: Sets a single red pixel at (391, 224) then Renders a red line between points (122, 161) and (92, 38).
; PLAN: r0=391(x), r1=224(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=122(x1), r6=161(y1), r7=92(x2), r8=38(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 391
LDI r1, 224
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 122
LDI r6, 161
LDI r7, 92
LDI r8, 38
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
