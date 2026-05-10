; DESCRIPTION: Draws a green line from (493, 82) to (139, 185).
; PLAN: r0=493(x1), r1=82(y1), r2=139(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 82
LDI r2, 139
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
