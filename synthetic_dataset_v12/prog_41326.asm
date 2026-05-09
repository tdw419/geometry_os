; DESCRIPTION: Renders a red line between points (417, 0) and (127, 229).
; PLAN: r0=417(x1), r1=0(y1), r2=127(x2), r3=229(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 0
LDI r2, 127
LDI r3, 229
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
