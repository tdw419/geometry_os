; DESCRIPTION: Renders a red line between points (111, 186) and (114, 92).
; PLAN: r0=111(x1), r1=186(y1), r2=114(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 186
LDI r2, 114
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
