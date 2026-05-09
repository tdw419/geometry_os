; DESCRIPTION: Renders a red line between points (480, 182) and (206, 179).
; PLAN: r0=480(x1), r1=182(y1), r2=206(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 182
LDI r2, 206
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
