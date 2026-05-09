; DESCRIPTION: Draws a purple line from (182, 230) to (152, 10).
; PLAN: r0=182(x1), r1=230(y1), r2=152(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 230
LDI r2, 152
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
