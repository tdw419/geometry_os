; DESCRIPTION: Draws a blue line from (188, 3) to (146, 236).
; PLAN: r0=188(x1), r1=3(y1), r2=146(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 3
LDI r2, 146
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
