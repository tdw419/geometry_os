; DESCRIPTION: Draws a magenta line from (416, 57) to (369, 82).
; PLAN: r0=416(x1), r1=57(y1), r2=369(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 57
LDI r2, 369
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
