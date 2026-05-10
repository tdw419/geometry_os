; DESCRIPTION: Composite: Renders a blue line between points (177, 178) and (54, 103) then Places a orange dot at position (130, 18).
; PLAN: r0=177(x1), r1=178(y1), r2=54(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=130(x), r6=18(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 177
LDI r1, 178
LDI r2, 54
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 18
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
