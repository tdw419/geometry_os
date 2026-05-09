; DESCRIPTION: Renders a white line between points (20, 87) and (124, 108).
; PLAN: r0=20(x1), r1=87(y1), r2=124(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 87
LDI r2, 124
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
