; DESCRIPTION: Draws a magenta line from (475, 68) to (351, 59).
; PLAN: r0=475(x1), r1=68(y1), r2=351(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 68
LDI r2, 351
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
