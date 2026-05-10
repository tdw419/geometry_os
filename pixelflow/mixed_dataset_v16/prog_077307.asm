; DESCRIPTION: Composite: Places a red dot at position (90, 250) then Draws a magenta line from (97, 134) to (140, 242).
; PLAN: r0=90(x), r1=250(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=97(x1), r6=134(y1), r7=140(x2), r8=242(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 250
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 97
LDI r6, 134
LDI r7, 140
LDI r8, 242
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
