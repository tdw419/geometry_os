; DESCRIPTION: Draws a magenta line from (416, 77) to (194, 55).
; PLAN: r0=416(x1), r1=77(y1), r2=194(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 77
LDI r2, 194
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
