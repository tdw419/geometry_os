; DESCRIPTION: Composite: Draws a magenta line from (148, 222) to (23, 87) then Places a blue dot at position (143, 78).
; PLAN: r0=148(x1), r1=222(y1), r2=23(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=78(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 148
LDI r1, 222
LDI r2, 23
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 78
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
