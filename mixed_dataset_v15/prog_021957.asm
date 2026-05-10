; DESCRIPTION: Draws a green line from (28, 24) to (423, 251).
; PLAN: r0=28(x1), r1=24(y1), r2=423(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 24
LDI r2, 423
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
