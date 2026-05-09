; DESCRIPTION: Composite: Places a cyan dot at position (180, 89) then Places a green line segment connecting (157, 72) to (96, 146).
; PLAN: r0=180(x), r1=89(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=157(x1), r6=72(y1), r7=96(x2), r8=146(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 180
LDI r1, 89
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 157
LDI r6, 72
LDI r7, 96
LDI r8, 146
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
