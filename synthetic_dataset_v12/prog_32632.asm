; DESCRIPTION: Draws a purple line from (214, 160) to (415, 162).
; PLAN: r0=214(x1), r1=160(y1), r2=415(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 160
LDI r2, 415
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
