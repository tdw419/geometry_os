; DESCRIPTION: Renders a red line between points (138, 33) and (152, 254).
; PLAN: r0=138(x1), r1=33(y1), r2=152(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 33
LDI r2, 152
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
