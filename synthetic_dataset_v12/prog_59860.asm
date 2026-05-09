; DESCRIPTION: Draws a magenta line from (321, 135) to (186, 124).
; PLAN: r0=321(x1), r1=135(y1), r2=186(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 135
LDI r2, 186
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
