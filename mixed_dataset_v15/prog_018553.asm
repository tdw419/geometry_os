; DESCRIPTION: Renders a red line between points (48, 64) and (248, 66).
; PLAN: r0=48(x1), r1=64(y1), r2=248(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 64
LDI r2, 248
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
