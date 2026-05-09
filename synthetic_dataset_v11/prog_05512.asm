; DESCRIPTION: Draws a purple line from (8, 223) to (167, 221).
; PLAN: r0=8(x1), r1=223(y1), r2=167(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 223
LDI r2, 167
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
