; DESCRIPTION: Draws a blue line from (187, 43) to (94, 200).
; PLAN: r0=187(x1), r1=43(y1), r2=94(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 43
LDI r2, 94
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
