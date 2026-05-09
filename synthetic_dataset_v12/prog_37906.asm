; DESCRIPTION: Renders a red line between points (500, 124) and (218, 0).
; PLAN: r0=500(x1), r1=124(y1), r2=218(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 124
LDI r2, 218
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
