; DESCRIPTION: Renders a red line between points (409, 19) and (328, 255).
; PLAN: r0=409(x1), r1=19(y1), r2=328(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 19
LDI r2, 328
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
