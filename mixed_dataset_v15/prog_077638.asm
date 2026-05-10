; DESCRIPTION: Draws a green line from (260, 183) to (355, 87).
; PLAN: r0=260(x1), r1=183(y1), r2=355(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 183
LDI r2, 355
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
