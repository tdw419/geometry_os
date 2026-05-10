; DESCRIPTION: Composite: Renders a yellow line between points (127, 89) and (184, 169) then Places a magenta dot at position (506, 71).
; PLAN: r0=127(x1), r1=89(y1), r2=184(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=506(x), r6=71(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 127
LDI r1, 89
LDI r2, 184
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 506
LDI r6, 71
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
