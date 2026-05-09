; DESCRIPTION: Draws a blue line from (152, 73) to (253, 200).
; PLAN: r0=152(x1), r1=73(y1), r2=253(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 73
LDI r2, 253
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
