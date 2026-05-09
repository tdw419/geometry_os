; DESCRIPTION: Renders a white line between points (126, 61) and (133, 253).
; PLAN: r0=126(x1), r1=61(y1), r2=133(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 61
LDI r2, 133
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
