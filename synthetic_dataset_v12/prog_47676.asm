; DESCRIPTION: Composite: Places a blue dot at position (140, 115) then Renders a blue line between points (223, 219) and (317, 132).
; PLAN: r0=140(x), r1=115(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=223(x1), r6=219(y1), r7=317(x2), r8=132(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 140
LDI r1, 115
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 219
LDI r7, 317
LDI r8, 132
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
