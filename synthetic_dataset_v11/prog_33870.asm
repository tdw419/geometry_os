; DESCRIPTION: Draws a blue line from (188, 209) to (174, 9).
; PLAN: r0=188(x1), r1=209(y1), r2=174(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 209
LDI r2, 174
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
