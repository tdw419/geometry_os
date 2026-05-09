; DESCRIPTION: Draws a blue line from (315, 168) to (344, 10).
; PLAN: r0=315(x1), r1=168(y1), r2=344(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 168
LDI r2, 344
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
