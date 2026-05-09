; DESCRIPTION: Composite: Places a white dot at position (107, 246) then Renders a red line between points (180, 19) and (304, 65).
; PLAN: r0=107(x), r1=246(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=180(x1), r6=19(y1), r7=304(x2), r8=65(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 246
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 180
LDI r6, 19
LDI r7, 304
LDI r8, 65
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
