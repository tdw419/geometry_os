; DESCRIPTION: Renders a red line between points (248, 208) and (156, 226).
; PLAN: r0=248(x1), r1=208(y1), r2=156(x2), r3=226(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 208
LDI r2, 156
LDI r3, 226
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
