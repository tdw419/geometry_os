; DESCRIPTION: Draws a blue line from (168, 75) to (366, 171).
; PLAN: r0=168(x1), r1=75(y1), r2=366(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 75
LDI r2, 366
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
