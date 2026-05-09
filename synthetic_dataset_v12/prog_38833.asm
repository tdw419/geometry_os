; DESCRIPTION: Draws a green line from (454, 61) to (489, 33).
; PLAN: r0=454(x1), r1=61(y1), r2=489(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 61
LDI r2, 489
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
