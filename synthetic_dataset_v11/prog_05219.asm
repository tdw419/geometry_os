; DESCRIPTION: Draws a blue line from (57, 37) to (249, 247).
; PLAN: r0=57(x1), r1=37(y1), r2=249(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 37
LDI r2, 249
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
