; DESCRIPTION: Renders a yellow line between points (500, 103) and (153, 248).
; PLAN: r0=500(x1), r1=103(y1), r2=153(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 103
LDI r2, 153
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
