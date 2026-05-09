; DESCRIPTION: Renders a white line between points (113, 193) and (116, 96).
; PLAN: r0=113(x1), r1=193(y1), r2=116(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 193
LDI r2, 116
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
