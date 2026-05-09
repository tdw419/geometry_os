; DESCRIPTION: Composite: Draws a green line from (503, 70) to (26, 174) then Sets a single red pixel at (409, 80).
; PLAN: r0=503(x1), r1=70(y1), r2=26(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=80(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 503
LDI r1, 70
LDI r2, 26
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 80
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
