; DESCRIPTION: Renders a white line between points (503, 120) and (251, 90).
; PLAN: r0=503(x1), r1=120(y1), r2=251(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 120
LDI r2, 251
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
