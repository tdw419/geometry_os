; DESCRIPTION: Renders a red line between points (191, 233) and (25, 192).
; PLAN: r0=191(x1), r1=233(y1), r2=25(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 233
LDI r2, 25
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
