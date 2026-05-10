; DESCRIPTION: Composite: Places a white dot at position (246, 193) then Draws a red line from (160, 139) to (350, 199).
; PLAN: r0=246(x), r1=193(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=160(x1), r6=139(y1), r7=350(x2), r8=199(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 246
LDI r1, 193
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 160
LDI r6, 139
LDI r7, 350
LDI r8, 199
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
