; DESCRIPTION: Renders a red line between points (40, 111) and (96, 68).
; PLAN: r0=40(x1), r1=111(y1), r2=96(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 111
LDI r2, 96
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
