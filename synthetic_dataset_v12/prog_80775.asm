; DESCRIPTION: Renders a red line between points (179, 212) and (374, 63).
; PLAN: r0=179(x1), r1=212(y1), r2=374(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 212
LDI r2, 374
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
