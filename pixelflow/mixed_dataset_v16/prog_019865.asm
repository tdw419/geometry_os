; DESCRIPTION: Composite: Places a cyan dot at position (1, 106) then Draws a magenta line from (47, 114) to (72, 139).
; PLAN: r0=1(x), r1=106(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=47(x1), r6=114(y1), r7=72(x2), r8=139(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 1
LDI r1, 106
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 47
LDI r6, 114
LDI r7, 72
LDI r8, 139
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
