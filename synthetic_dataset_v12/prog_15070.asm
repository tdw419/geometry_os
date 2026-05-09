; DESCRIPTION: Composite: Places a purple dot at position (115, 188) then Places a yellow line segment connecting (350, 165) to (140, 55).
; PLAN: r0=115(x), r1=188(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=350(x1), r6=165(y1), r7=140(x2), r8=55(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 115
LDI r1, 188
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 350
LDI r6, 165
LDI r7, 140
LDI r8, 55
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
