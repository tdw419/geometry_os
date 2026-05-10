; DESCRIPTION: Renders a yellow line between points (146, 29) and (280, 77).
; PLAN: r0=146(x1), r1=29(y1), r2=280(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 29
LDI r2, 280
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
