; DESCRIPTION: Renders a red line between points (332, 247) and (264, 144).
; PLAN: r0=332(x1), r1=247(y1), r2=264(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 247
LDI r2, 264
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
