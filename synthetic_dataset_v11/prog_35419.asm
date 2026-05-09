; DESCRIPTION: Renders a yellow line between points (217, 233) and (43, 177).
; PLAN: r0=217(x1), r1=233(y1), r2=43(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 233
LDI r2, 43
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
