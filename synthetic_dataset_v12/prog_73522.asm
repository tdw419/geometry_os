; DESCRIPTION: Composite: Sets a single white pixel at (372, 84) then Draws a red line from (171, 227) to (463, 21).
; PLAN: r0=372(x), r1=84(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=171(x1), r6=227(y1), r7=463(x2), r8=21(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 84
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 171
LDI r6, 227
LDI r7, 463
LDI r8, 21
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
