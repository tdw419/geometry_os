; DESCRIPTION: Composite: Places a blue dot at position (83, 26) then Draws a cyan line from (146, 6) to (113, 195).
; PLAN: r0=83(x), r1=26(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=146(x1), r6=6(y1), r7=113(x2), r8=195(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 83
LDI r1, 26
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 146
LDI r6, 6
LDI r7, 113
LDI r8, 195
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
