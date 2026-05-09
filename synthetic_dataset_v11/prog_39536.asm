; DESCRIPTION: Draws a blue line from (202, 230) to (38, 157).
; PLAN: r0=202(x1), r1=230(y1), r2=38(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 230
LDI r2, 38
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
