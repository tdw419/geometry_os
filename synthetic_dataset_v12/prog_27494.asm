; DESCRIPTION: Renders a yellow line between points (308, 210) and (306, 90).
; PLAN: r0=308(x1), r1=210(y1), r2=306(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 210
LDI r2, 306
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
