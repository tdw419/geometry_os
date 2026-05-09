; DESCRIPTION: Renders a red line between points (279, 50) and (511, 230).
; PLAN: r0=279(x1), r1=50(y1), r2=511(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 50
LDI r2, 511
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
