; DESCRIPTION: Composite: Places a green dot at position (471, 250) then Renders a green line between points (353, 149) and (83, 177).
; PLAN: r0=471(x), r1=250(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=353(x1), r6=149(y1), r7=83(x2), r8=177(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 471
LDI r1, 250
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 353
LDI r6, 149
LDI r7, 83
LDI r8, 177
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
