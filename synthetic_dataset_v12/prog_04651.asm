; DESCRIPTION: Draws a blue line from (432, 168) to (165, 134).
; PLAN: r0=432(x1), r1=168(y1), r2=165(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 168
LDI r2, 165
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
