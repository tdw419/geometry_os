; DESCRIPTION: Renders a white line between points (162, 175) and (221, 55).
; PLAN: r0=162(x1), r1=175(y1), r2=221(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 175
LDI r2, 221
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
