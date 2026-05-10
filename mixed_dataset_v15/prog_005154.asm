; DESCRIPTION: Composite: Sets a single green pixel at (311, 145) then Draws a white line from (336, 108) to (121, 223).
; PLAN: r0=311(x), r1=145(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=336(x1), r6=108(y1), r7=121(x2), r8=223(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 311
LDI r1, 145
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 336
LDI r6, 108
LDI r7, 121
LDI r8, 223
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
