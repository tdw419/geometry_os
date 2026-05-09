; DESCRIPTION: Draws a green line from (56, 142) to (50, 169).
; PLAN: r0=56(x1), r1=142(y1), r2=50(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 142
LDI r2, 50
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
