; DESCRIPTION: Draws a red line from (225, 14) to (331, 226).
; PLAN: r0=225(x1), r1=14(y1), r2=331(x2), r3=226(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 14
LDI r2, 331
LDI r3, 226
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
