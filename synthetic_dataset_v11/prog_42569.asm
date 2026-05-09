; DESCRIPTION: Draws a blue line from (213, 97) to (83, 33).
; PLAN: r0=213(x1), r1=97(y1), r2=83(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 97
LDI r2, 83
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
