; DESCRIPTION: Draws a white line from (195, 231) to (124, 35).
; PLAN: r0=195(x1), r1=231(y1), r2=124(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 231
LDI r2, 124
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
