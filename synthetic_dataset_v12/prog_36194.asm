; DESCRIPTION: Renders a yellow line between points (410, 112) and (269, 138).
; PLAN: r0=410(x1), r1=112(y1), r2=269(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 112
LDI r2, 269
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
