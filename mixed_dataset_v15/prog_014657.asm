; DESCRIPTION: Draws a red line from (296, 106) to (39, 144).
; PLAN: r0=296(x1), r1=106(y1), r2=39(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 106
LDI r2, 39
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
