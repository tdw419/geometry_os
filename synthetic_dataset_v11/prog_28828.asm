; DESCRIPTION: Draws a white line from (86, 104) to (185, 150).
; PLAN: r0=86(x1), r1=104(y1), r2=185(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 104
LDI r2, 185
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
