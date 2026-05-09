; DESCRIPTION: Draws a blue line from (4, 177) to (352, 233).
; PLAN: r0=4(x1), r1=177(y1), r2=352(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 177
LDI r2, 352
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
