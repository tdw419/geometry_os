; DESCRIPTION: Renders a red line between points (17, 195) and (389, 6).
; PLAN: r0=17(x1), r1=195(y1), r2=389(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 195
LDI r2, 389
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
