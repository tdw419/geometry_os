; DESCRIPTION: Composite: Sets a single cyan pixel at (475, 143) then Draws a blue line from (39, 40) to (126, 181).
; PLAN: r0=475(x), r1=143(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=39(x1), r6=40(y1), r7=126(x2), r8=181(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 475
LDI r1, 143
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 39
LDI r6, 40
LDI r7, 126
LDI r8, 181
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
