; DESCRIPTION: Draws a blue line from (393, 148) to (262, 44).
; PLAN: r0=393(x1), r1=148(y1), r2=262(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 148
LDI r2, 262
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
