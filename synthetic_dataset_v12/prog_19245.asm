; DESCRIPTION: Composite: Sets a single green pixel at (86, 124) then Draws a purple line from (60, 55) to (358, 87).
; PLAN: r0=86(x), r1=124(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=60(x1), r6=55(y1), r7=358(x2), r8=87(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 86
LDI r1, 124
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 60
LDI r6, 55
LDI r7, 358
LDI r8, 87
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
