; DESCRIPTION: Draws a blue line from (61, 140) to (380, 56).
; PLAN: r0=61(x1), r1=140(y1), r2=380(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 140
LDI r2, 380
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
