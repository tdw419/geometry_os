; DESCRIPTION: Composite: Draws a magenta line from (199, 236) to (205, 4) then Places a blue dot at position (118, 227).
; PLAN: r0=199(x1), r1=236(y1), r2=205(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=118(x), r6=227(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 199
LDI r1, 236
LDI r2, 205
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 227
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
