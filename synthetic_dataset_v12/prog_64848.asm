; DESCRIPTION: Renders a red line between points (271, 3) and (20, 51).
; PLAN: r0=271(x1), r1=3(y1), r2=20(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 3
LDI r2, 20
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
