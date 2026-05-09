; DESCRIPTION: Renders a white line between points (414, 194) and (80, 220).
; PLAN: r0=414(x1), r1=194(y1), r2=80(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 194
LDI r2, 80
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
