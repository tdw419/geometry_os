; DESCRIPTION: Draws a blue line from (192, 161) to (181, 27).
; PLAN: r0=192(x1), r1=161(y1), r2=181(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 161
LDI r2, 181
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
