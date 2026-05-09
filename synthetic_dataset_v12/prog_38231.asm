; DESCRIPTION: Draws a purple line from (459, 214) to (295, 20).
; PLAN: r0=459(x1), r1=214(y1), r2=295(x2), r3=20(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 214
LDI r2, 295
LDI r3, 20
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
