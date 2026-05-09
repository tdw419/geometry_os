; DESCRIPTION: Draws a blue line from (177, 183) to (392, 198).
; PLAN: r0=177(x1), r1=183(y1), r2=392(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 183
LDI r2, 392
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
