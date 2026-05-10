; DESCRIPTION: Renders a red line between points (202, 122) and (51, 83).
; PLAN: r0=202(x1), r1=122(y1), r2=51(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 122
LDI r2, 51
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
