; DESCRIPTION: Draws a blue line from (342, 212) to (202, 214).
; PLAN: r0=342(x1), r1=212(y1), r2=202(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 212
LDI r2, 202
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
