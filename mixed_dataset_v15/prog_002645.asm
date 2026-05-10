; DESCRIPTION: Composite: Renders a blue line between points (216, 200) and (448, 177) then Places a orange dot at position (112, 215).
; PLAN: r0=216(x1), r1=200(y1), r2=448(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=215(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 216
LDI r1, 200
LDI r2, 448
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 215
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
