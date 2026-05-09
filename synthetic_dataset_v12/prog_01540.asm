; DESCRIPTION: Composite: Draws a red line from (184, 233) to (349, 82) then Sets a single red pixel at (150, 236).
; PLAN: r0=184(x1), r1=233(y1), r2=349(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=150(x), r6=236(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 184
LDI r1, 233
LDI r2, 349
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 236
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
