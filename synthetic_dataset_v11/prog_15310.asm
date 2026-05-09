; DESCRIPTION: Draws a cyan line from (251, 65) to (119, 155).
; PLAN: r0=251(x1), r1=65(y1), r2=119(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 65
LDI r2, 119
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
