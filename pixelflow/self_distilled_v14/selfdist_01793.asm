; DESCRIPTION: Draws a blue line from (225, 73) to (308, 162).
; PLAN: r0=225(x1), r1=73(y1), r2=308(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 73
LDI r2, 308
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
