; DESCRIPTION: Renders a red line between points (129, 175) and (422, 182).
; PLAN: r0=129(x1), r1=175(y1), r2=422(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 175
LDI r2, 422
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
