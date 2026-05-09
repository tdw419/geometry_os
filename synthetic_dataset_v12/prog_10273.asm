; DESCRIPTION: Renders a red line between points (64, 100) and (313, 200).
; PLAN: r0=64(x1), r1=100(y1), r2=313(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 100
LDI r2, 313
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
