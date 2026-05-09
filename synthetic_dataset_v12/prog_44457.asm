; DESCRIPTION: Composite: Places a cyan dot at position (345, 187) then Renders a magenta line between points (230, 190) and (366, 203).
; PLAN: r0=345(x), r1=187(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=230(x1), r6=190(y1), r7=366(x2), r8=203(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 187
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 230
LDI r6, 190
LDI r7, 366
LDI r8, 203
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
