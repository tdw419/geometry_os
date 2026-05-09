; DESCRIPTION: Composite: Places a white dot at position (271, 133) then Renders a yellow line between points (302, 223) and (155, 118).
; PLAN: r0=271(x), r1=133(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=302(x1), r6=223(y1), r7=155(x2), r8=118(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 133
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 302
LDI r6, 223
LDI r7, 155
LDI r8, 118
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
