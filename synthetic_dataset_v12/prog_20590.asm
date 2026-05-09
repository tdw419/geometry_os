; DESCRIPTION: Draws a green line from (359, 45) to (143, 250).
; PLAN: r0=359(x1), r1=45(y1), r2=143(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 45
LDI r2, 143
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
