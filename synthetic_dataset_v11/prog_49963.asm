; DESCRIPTION: Draws a green line from (225, 80) to (88, 226).
; PLAN: r0=225(x1), r1=80(y1), r2=88(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 80
LDI r2, 88
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
