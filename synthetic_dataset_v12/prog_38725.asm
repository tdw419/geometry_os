; DESCRIPTION: Renders a white line between points (54, 95) and (175, 250).
; PLAN: r0=54(x1), r1=95(y1), r2=175(x2), r3=250(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 95
LDI r2, 175
LDI r3, 250
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
