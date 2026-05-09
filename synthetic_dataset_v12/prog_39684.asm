; DESCRIPTION: Renders a white line between points (135, 1) and (404, 77).
; PLAN: r0=135(x1), r1=1(y1), r2=404(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 1
LDI r2, 404
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
