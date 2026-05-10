; DESCRIPTION: Composite: Sets a single cyan pixel at (362, 3) then Renders a red line between points (236, 195) and (61, 121).
; PLAN: r0=362(x), r1=3(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=236(x1), r6=195(y1), r7=61(x2), r8=121(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 362
LDI r1, 3
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 236
LDI r6, 195
LDI r7, 61
LDI r8, 121
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
