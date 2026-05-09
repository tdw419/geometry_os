; DESCRIPTION: Draws a purple line from (445, 123) to (256, 152).
; PLAN: r0=445(x1), r1=123(y1), r2=256(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 123
LDI r2, 256
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
