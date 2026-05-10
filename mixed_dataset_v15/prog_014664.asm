; DESCRIPTION: Draws a red line from (206, 84) to (188, 167).
; PLAN: r0=206(x1), r1=84(y1), r2=188(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 84
LDI r2, 188
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
