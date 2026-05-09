; DESCRIPTION: Draws a blue line from (164, 40) to (176, 220).
; PLAN: r0=164(x1), r1=40(y1), r2=176(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 40
LDI r2, 176
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
