; DESCRIPTION: Composite: Renders a red line between points (179, 194) and (11, 59) then Sets a single cyan pixel at (495, 176).
; PLAN: r0=179(x1), r1=194(y1), r2=11(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=495(x), r6=176(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 179
LDI r1, 194
LDI r2, 11
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 176
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
