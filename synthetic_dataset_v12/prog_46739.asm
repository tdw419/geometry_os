; DESCRIPTION: Draws a purple line from (120, 129) to (319, 152).
; PLAN: r0=120(x1), r1=129(y1), r2=319(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 129
LDI r2, 319
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
