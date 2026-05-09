; DESCRIPTION: Renders a red line between points (486, 2) and (108, 11).
; PLAN: r0=486(x1), r1=2(y1), r2=108(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 2
LDI r2, 108
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
