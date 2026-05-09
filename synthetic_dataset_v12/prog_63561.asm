; DESCRIPTION: Renders a red line between points (487, 143) and (286, 179).
; PLAN: r0=487(x1), r1=143(y1), r2=286(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 143
LDI r2, 286
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
