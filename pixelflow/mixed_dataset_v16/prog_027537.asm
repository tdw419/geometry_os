; DESCRIPTION: Draws a purple line from (270, 103) to (291, 186).
; PLAN: r0=270(x1), r1=103(y1), r2=291(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 103
LDI r2, 291
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
