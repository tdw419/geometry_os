; DESCRIPTION: Renders a white line between points (500, 163) and (182, 1).
; PLAN: r0=500(x1), r1=163(y1), r2=182(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 163
LDI r2, 182
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
