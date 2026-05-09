; DESCRIPTION: Draws a blue line from (466, 59) to (290, 227).
; PLAN: r0=466(x1), r1=59(y1), r2=290(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 59
LDI r2, 290
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
