; DESCRIPTION: Renders a white line between points (208, 76) and (190, 138).
; PLAN: r0=208(x1), r1=76(y1), r2=190(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 76
LDI r2, 190
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
