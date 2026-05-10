; DESCRIPTION: Draws a green line from (492, 158) to (250, 226).
; PLAN: r0=492(x1), r1=158(y1), r2=250(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 158
LDI r2, 250
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
