; DESCRIPTION: Draws a blue line from (137, 24) to (167, 186).
; PLAN: r0=137(x1), r1=24(y1), r2=167(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 24
LDI r2, 167
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
