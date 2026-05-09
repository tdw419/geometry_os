; DESCRIPTION: Draws a green line from (160, 159) to (75, 35).
; PLAN: r0=160(x1), r1=159(y1), r2=75(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 159
LDI r2, 75
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
