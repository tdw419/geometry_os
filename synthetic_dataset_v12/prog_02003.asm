; DESCRIPTION: Renders a yellow line between points (115, 186) and (502, 90).
; PLAN: r0=115(x1), r1=186(y1), r2=502(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 186
LDI r2, 502
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
