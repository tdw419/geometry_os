; DESCRIPTION: Renders a red line between points (229, 64) and (107, 180).
; PLAN: r0=229(x1), r1=64(y1), r2=107(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 64
LDI r2, 107
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
