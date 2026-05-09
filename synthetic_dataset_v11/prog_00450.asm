; DESCRIPTION: Draws a blue line from (68, 128) to (177, 10).
; PLAN: r0=68(x1), r1=128(y1), r2=177(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 128
LDI r2, 177
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
