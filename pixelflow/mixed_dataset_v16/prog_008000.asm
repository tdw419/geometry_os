; DESCRIPTION: Draws a blue line from (324, 255) to (251, 82).
; PLAN: r0=324(x1), r1=255(y1), r2=251(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 255
LDI r2, 251
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
