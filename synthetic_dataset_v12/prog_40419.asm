; DESCRIPTION: Renders a yellow line between points (269, 233) and (439, 81).
; PLAN: r0=269(x1), r1=233(y1), r2=439(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 233
LDI r2, 439
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
