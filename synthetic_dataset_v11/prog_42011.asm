; DESCRIPTION: Draws a green line from (104, 61) to (105, 34).
; PLAN: r0=104(x1), r1=61(y1), r2=105(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 61
LDI r2, 105
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
