; DESCRIPTION: Draws a blue line from (360, 170) to (168, 99).
; PLAN: r0=360(x1), r1=170(y1), r2=168(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 170
LDI r2, 168
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
