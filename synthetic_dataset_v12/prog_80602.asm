; DESCRIPTION: Draws a red line from (124, 104) to (409, 86).
; PLAN: r0=124(x1), r1=104(y1), r2=409(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 104
LDI r2, 409
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
