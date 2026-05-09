; DESCRIPTION: Renders a red line between points (85, 167) and (493, 220).
; PLAN: r0=85(x1), r1=167(y1), r2=493(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 167
LDI r2, 493
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
