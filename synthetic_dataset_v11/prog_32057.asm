; DESCRIPTION: Renders a white line between points (25, 182) and (178, 70).
; PLAN: r0=25(x1), r1=182(y1), r2=178(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 182
LDI r2, 178
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
