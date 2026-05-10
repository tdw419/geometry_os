; DESCRIPTION: Composite: Sets a single black pixel at (401, 255) then Renders a black line between points (376, 241) and (248, 202).
; PLAN: r0=401(x), r1=255(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=376(x1), r6=241(y1), r7=248(x2), r8=202(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 255
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 376
LDI r6, 241
LDI r7, 248
LDI r8, 202
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
