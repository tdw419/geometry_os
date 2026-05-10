; DESCRIPTION: Composite: Places a cyan line segment connecting (100, 188) to (438, 84) then Sets a single magenta pixel at (267, 191).
; PLAN: r0=100(x1), r1=188(y1), r2=438(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=267(x), r6=191(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 100
LDI r1, 188
LDI r2, 438
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 191
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
