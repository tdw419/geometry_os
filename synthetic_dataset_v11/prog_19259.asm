; DESCRIPTION: Renders a green line between points (5, 182) and (179, 120).
; PLAN: r0=5(x1), r1=182(y1), r2=179(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 182
LDI r2, 179
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
