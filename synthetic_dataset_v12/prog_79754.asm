; DESCRIPTION: Composite: Sets a single white pixel at (479, 6) then Draws a white line from (273, 178) to (34, 248).
; PLAN: r0=479(x), r1=6(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=273(x1), r6=178(y1), r7=34(x2), r8=248(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 479
LDI r1, 6
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 273
LDI r6, 178
LDI r7, 34
LDI r8, 248
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
