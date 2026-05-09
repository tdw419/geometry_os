; DESCRIPTION: Composite: Places a yellow dot at position (133, 25) then Draws a white line from (157, 178) to (140, 161).
; PLAN: r0=133(x), r1=25(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=157(x1), r6=178(y1), r7=140(x2), r8=161(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 25
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 157
LDI r6, 178
LDI r7, 140
LDI r8, 161
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
