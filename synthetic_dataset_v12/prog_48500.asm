; DESCRIPTION: Draws a yellow line from (34, 164) to (180, 106).
; PLAN: r0=34(x1), r1=164(y1), r2=180(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 164
LDI r2, 180
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
