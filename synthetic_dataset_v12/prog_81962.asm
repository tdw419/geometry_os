; DESCRIPTION: Draws a blue line from (139, 200) to (370, 57).
; PLAN: r0=139(x1), r1=200(y1), r2=370(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 200
LDI r2, 370
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
