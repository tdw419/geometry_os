; DESCRIPTION: Draws a blue line from (188, 204) to (69, 221).
; PLAN: r0=188(x1), r1=204(y1), r2=69(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 204
LDI r2, 69
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
