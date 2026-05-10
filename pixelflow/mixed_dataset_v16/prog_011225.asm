; DESCRIPTION: Composite: Renders a blue line between points (73, 98) and (475, 134) then Places a green dot at position (463, 131).
; PLAN: r0=73(x1), r1=98(y1), r2=475(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=463(x), r6=131(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 73
LDI r1, 98
LDI r2, 475
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 131
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
