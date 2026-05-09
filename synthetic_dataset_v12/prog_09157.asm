; DESCRIPTION: Composite: Sets a single green pixel at (179, 195) then Draws a cyan line from (48, 123) to (87, 207).
; PLAN: r0=179(x), r1=195(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=48(x1), r6=123(y1), r7=87(x2), r8=207(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 179
LDI r1, 195
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 48
LDI r6, 123
LDI r7, 87
LDI r8, 207
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
