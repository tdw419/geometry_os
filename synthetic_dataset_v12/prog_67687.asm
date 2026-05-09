; DESCRIPTION: Draws a green line from (248, 124) to (170, 116).
; PLAN: r0=248(x1), r1=124(y1), r2=170(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 124
LDI r2, 170
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
