; DESCRIPTION: Renders a blue line between points (12, 74) and (31, 187).
; PLAN: r0=12(x1), r1=74(y1), r2=31(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 74
LDI r2, 31
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
