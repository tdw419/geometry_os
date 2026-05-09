; DESCRIPTION: Renders a red line between points (406, 179) and (417, 107).
; PLAN: r0=406(x1), r1=179(y1), r2=417(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 179
LDI r2, 417
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
