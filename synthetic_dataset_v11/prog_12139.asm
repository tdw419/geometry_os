; DESCRIPTION: Draws a green line from (119, 86) to (96, 250).
; PLAN: r0=119(x1), r1=86(y1), r2=96(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 86
LDI r2, 96
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
