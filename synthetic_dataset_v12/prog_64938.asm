; DESCRIPTION: Draws a blue line from (245, 236) to (246, 216).
; PLAN: r0=245(x1), r1=236(y1), r2=246(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 236
LDI r2, 246
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
