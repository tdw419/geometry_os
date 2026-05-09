; DESCRIPTION: Renders a purple line between points (7, 178) and (154, 152).
; PLAN: r0=7(x1), r1=178(y1), r2=154(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 178
LDI r2, 154
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
