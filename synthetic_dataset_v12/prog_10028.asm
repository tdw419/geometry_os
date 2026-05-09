; DESCRIPTION: Composite: Draws a blue line from (164, 105) to (0, 151) then Places a yellow dot at position (497, 61).
; PLAN: r0=164(x1), r1=105(y1), r2=0(x2), r3=151(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=497(x), r6=61(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 164
LDI r1, 105
LDI r2, 0
LDI r3, 151
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 497
LDI r6, 61
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
