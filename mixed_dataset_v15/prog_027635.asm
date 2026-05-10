; DESCRIPTION: Composite: Sets a single red pixel at (8, 126) then Draws a cyan line from (415, 10) to (390, 92).
; PLAN: r0=8(x), r1=126(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=415(x1), r6=10(y1), r7=390(x2), r8=92(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 8
LDI r1, 126
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 415
LDI r6, 10
LDI r7, 390
LDI r8, 92
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
