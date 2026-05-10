; DESCRIPTION: Renders a white line between points (428, 90) and (80, 196).
; PLAN: r0=428(x1), r1=90(y1), r2=80(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 90
LDI r2, 80
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
