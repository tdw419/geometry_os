; DESCRIPTION: Composite: Places a magenta dot at position (345, 99) then Renders a magenta line between points (192, 89) and (486, 108).
; PLAN: r0=345(x), r1=99(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=192(x1), r6=89(y1), r7=486(x2), r8=108(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 99
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 192
LDI r6, 89
LDI r7, 486
LDI r8, 108
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
