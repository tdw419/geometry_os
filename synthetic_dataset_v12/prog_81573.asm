; DESCRIPTION: Renders a white line between points (63, 144) and (80, 80).
; PLAN: r0=63(x1), r1=144(y1), r2=80(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 144
LDI r2, 80
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
