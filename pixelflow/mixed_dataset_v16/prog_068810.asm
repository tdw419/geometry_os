; DESCRIPTION: Draws a purple line from (503, 162) to (460, 237).
; PLAN: r0=503(x1), r1=162(y1), r2=460(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 162
LDI r2, 460
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
