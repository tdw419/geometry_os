; DESCRIPTION: Composite: Places a blue line segment connecting (77, 155) to (100, 74) then Places a green dot at position (274, 127).
; PLAN: r0=77(x1), r1=155(y1), r2=100(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=274(x), r6=127(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 77
LDI r1, 155
LDI r2, 100
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 127
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
