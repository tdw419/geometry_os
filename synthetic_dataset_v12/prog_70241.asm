; DESCRIPTION: Renders a white line between points (248, 240) and (306, 247).
; PLAN: r0=248(x1), r1=240(y1), r2=306(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 240
LDI r2, 306
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
