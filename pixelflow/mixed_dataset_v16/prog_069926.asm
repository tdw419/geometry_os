; DESCRIPTION: Composite: Places a blue line segment connecting (82, 255) to (419, 254) then Sets a single magenta pixel at (229, 178).
; PLAN: r0=82(x1), r1=255(y1), r2=419(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=178(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 82
LDI r1, 255
LDI r2, 419
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 178
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
