; DESCRIPTION: Renders a red line between points (408, 226) and (349, 206).
; PLAN: r0=408(x1), r1=226(y1), r2=349(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 226
LDI r2, 349
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
