; DESCRIPTION: Draws a blue line from (252, 10) to (339, 57).
; PLAN: r0=252(x1), r1=10(y1), r2=339(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 10
LDI r2, 339
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
