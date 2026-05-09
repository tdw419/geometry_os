; DESCRIPTION: Renders a red line between points (393, 179) and (174, 174).
; PLAN: r0=393(x1), r1=179(y1), r2=174(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 179
LDI r2, 174
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
