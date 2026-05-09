; DESCRIPTION: Renders a blue line between points (187, 124) and (348, 160).
; PLAN: r0=187(x1), r1=124(y1), r2=348(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 124
LDI r2, 348
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
