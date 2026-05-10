; DESCRIPTION: Renders a green line between points (457, 72) and (505, 202).
; PLAN: r0=457(x1), r1=72(y1), r2=505(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 72
LDI r2, 505
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
