; DESCRIPTION: Renders a black line between points (132, 180) and (156, 246).
; PLAN: r0=132(x1), r1=180(y1), r2=156(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 180
LDI r2, 156
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
