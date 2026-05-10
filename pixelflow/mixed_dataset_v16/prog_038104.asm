; DESCRIPTION: Draws a blue line from (214, 16) to (188, 39).
; PLAN: r0=214(x1), r1=16(y1), r2=188(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 16
LDI r2, 188
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
