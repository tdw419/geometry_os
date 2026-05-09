; DESCRIPTION: Renders a cyan line between points (22, 200) and (505, 181).
; PLAN: r0=22(x1), r1=200(y1), r2=505(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 200
LDI r2, 505
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
