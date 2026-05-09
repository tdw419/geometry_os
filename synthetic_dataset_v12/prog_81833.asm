; DESCRIPTION: Renders a red line between points (202, 226) and (385, 232).
; PLAN: r0=202(x1), r1=226(y1), r2=385(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 226
LDI r2, 385
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
