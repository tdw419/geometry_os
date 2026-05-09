; DESCRIPTION: Draws a magenta line from (415, 68) to (385, 250).
; PLAN: r0=415(x1), r1=68(y1), r2=385(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 68
LDI r2, 385
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
