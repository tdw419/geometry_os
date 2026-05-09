; DESCRIPTION: Draws a blue line from (183, 104) to (435, 14).
; PLAN: r0=183(x1), r1=104(y1), r2=435(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 104
LDI r2, 435
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
