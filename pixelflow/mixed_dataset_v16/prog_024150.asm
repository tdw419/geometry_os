; DESCRIPTION: Composite: Draws a cyan line from (0, 123) to (363, 213) then Sets a single green pixel at (135, 104).
; PLAN: r0=0(x1), r1=123(y1), r2=363(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=135(x), r6=104(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 0
LDI r1, 123
LDI r2, 363
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 104
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
