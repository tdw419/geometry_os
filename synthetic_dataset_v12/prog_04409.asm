; DESCRIPTION: Composite: Places a purple dot at position (25, 219) then Renders a white line between points (362, 235) and (462, 153).
; PLAN: r0=25(x), r1=219(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=362(x1), r6=235(y1), r7=462(x2), r8=153(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 25
LDI r1, 219
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 362
LDI r6, 235
LDI r7, 462
LDI r8, 153
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
