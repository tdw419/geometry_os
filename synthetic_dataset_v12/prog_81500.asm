; DESCRIPTION: Renders a red line between points (392, 106) and (441, 64).
; PLAN: r0=392(x1), r1=106(y1), r2=441(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 106
LDI r2, 441
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
