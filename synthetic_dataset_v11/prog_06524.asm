; DESCRIPTION: Draws a blue line from (164, 24) to (177, 221).
; PLAN: r0=164(x1), r1=24(y1), r2=177(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 24
LDI r2, 177
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
