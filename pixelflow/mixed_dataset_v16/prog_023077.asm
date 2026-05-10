; DESCRIPTION: Renders a red line between points (304, 253) and (227, 175).
; PLAN: r0=304(x1), r1=253(y1), r2=227(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 253
LDI r2, 227
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
