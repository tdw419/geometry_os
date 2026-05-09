; DESCRIPTION: Draws a blue line from (21, 176) to (93, 19).
; PLAN: r0=21(x1), r1=176(y1), r2=93(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 176
LDI r2, 93
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
