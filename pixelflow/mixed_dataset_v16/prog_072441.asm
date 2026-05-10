; DESCRIPTION: Draws a purple line from (69, 162) to (368, 174).
; PLAN: r0=69(x1), r1=162(y1), r2=368(x2), r3=174(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 162
LDI r2, 368
LDI r3, 174
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
