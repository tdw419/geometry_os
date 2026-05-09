; DESCRIPTION: Composite: Draws a blue line from (177, 132) to (464, 196) then Sets a single yellow pixel at (125, 156).
; PLAN: r0=177(x1), r1=132(y1), r2=464(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=156(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 177
LDI r1, 132
LDI r2, 464
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 156
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
