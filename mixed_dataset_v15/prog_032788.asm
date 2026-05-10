; DESCRIPTION: Composite: Places a green dot at position (157, 241) then Draws a red line from (259, 212) to (423, 47).
; PLAN: r0=157(x), r1=241(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=259(x1), r6=212(y1), r7=423(x2), r8=47(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 157
LDI r1, 241
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 259
LDI r6, 212
LDI r7, 423
LDI r8, 47
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
