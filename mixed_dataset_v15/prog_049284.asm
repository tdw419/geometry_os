; DESCRIPTION: Renders a red line between points (31, 140) and (108, 219).
; PLAN: r0=31(x1), r1=140(y1), r2=108(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 140
LDI r2, 108
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
