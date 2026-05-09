; DESCRIPTION: Draws a green line from (96, 187) to (142, 188).
; PLAN: r0=96(x1), r1=187(y1), r2=142(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 187
LDI r2, 142
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
