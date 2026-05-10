; DESCRIPTION: Composite: Draws a magenta line from (38, 47) to (325, 217) then Places a blue dot at position (465, 112).
; PLAN: r0=38(x1), r1=47(y1), r2=325(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=465(x), r6=112(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 38
LDI r1, 47
LDI r2, 325
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 112
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
