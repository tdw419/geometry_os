; DESCRIPTION: Renders a white line between points (162, 177) and (222, 29).
; PLAN: r0=162(x1), r1=177(y1), r2=222(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 177
LDI r2, 222
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
