; DESCRIPTION: Composite: Draws a magenta line from (134, 78) to (215, 225) then Places a orange dot at position (498, 93).
; PLAN: r0=134(x1), r1=78(y1), r2=215(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=498(x), r6=93(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 134
LDI r1, 78
LDI r2, 215
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 498
LDI r6, 93
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
