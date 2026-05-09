; DESCRIPTION: Renders a green line between points (35, 52) and (152, 165).
; PLAN: r0=35(x1), r1=52(y1), r2=152(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 52
LDI r2, 152
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
