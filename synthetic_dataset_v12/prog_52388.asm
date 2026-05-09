; DESCRIPTION: Renders a yellow line between points (303, 24) and (505, 107).
; PLAN: r0=303(x1), r1=24(y1), r2=505(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 24
LDI r2, 505
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
