; DESCRIPTION: Draws a blue line from (273, 176) to (43, 209).
; PLAN: r0=273(x1), r1=176(y1), r2=43(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 176
LDI r2, 43
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
