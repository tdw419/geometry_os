; DESCRIPTION: Renders a red line between points (202, 135) and (254, 129).
; PLAN: r0=202(x1), r1=135(y1), r2=254(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 135
LDI r2, 254
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
