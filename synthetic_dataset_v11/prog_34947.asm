; DESCRIPTION: Draws a green line from (134, 178) to (96, 251).
; PLAN: r0=134(x1), r1=178(y1), r2=96(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 178
LDI r2, 96
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
