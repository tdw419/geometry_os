; DESCRIPTION: Composite: Sets a single cyan pixel at (149, 60) then Draws a cyan line from (313, 27) to (182, 66).
; PLAN: r0=149(x), r1=60(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=313(x1), r6=27(y1), r7=182(x2), r8=66(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 149
LDI r1, 60
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 313
LDI r6, 27
LDI r7, 182
LDI r8, 66
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
