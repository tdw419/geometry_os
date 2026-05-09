; DESCRIPTION: Draws a white line from (58, 87) to (71, 35).
; PLAN: r0=58(x1), r1=87(y1), r2=71(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 87
LDI r2, 71
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
