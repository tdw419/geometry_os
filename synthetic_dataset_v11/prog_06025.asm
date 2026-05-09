; DESCRIPTION: Renders a black line between points (7, 218) and (135, 117).
; PLAN: r0=7(x1), r1=218(y1), r2=135(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 218
LDI r2, 135
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
