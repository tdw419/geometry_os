; DESCRIPTION: Draws a magenta line from (428, 136) to (394, 218).
; PLAN: r0=428(x1), r1=136(y1), r2=394(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 136
LDI r2, 394
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
