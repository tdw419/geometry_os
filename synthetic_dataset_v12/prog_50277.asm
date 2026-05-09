; DESCRIPTION: Draws a blue line from (60, 201) to (339, 113).
; PLAN: r0=60(x1), r1=201(y1), r2=339(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 201
LDI r2, 339
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
