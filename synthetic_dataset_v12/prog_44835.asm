; DESCRIPTION: Draws a blue line from (430, 23) to (479, 200).
; PLAN: r0=430(x1), r1=23(y1), r2=479(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 23
LDI r2, 479
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
