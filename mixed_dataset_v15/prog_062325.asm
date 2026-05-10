; DESCRIPTION: Renders a white line between points (135, 253) and (190, 90).
; PLAN: r0=135(x1), r1=253(y1), r2=190(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 253
LDI r2, 190
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
