; DESCRIPTION: Composite: Sets a single white pixel at (332, 77) then Draws a cyan line from (240, 60) to (390, 31).
; PLAN: r0=332(x), r1=77(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=240(x1), r6=60(y1), r7=390(x2), r8=31(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 77
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 240
LDI r6, 60
LDI r7, 390
LDI r8, 31
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
