; DESCRIPTION: Renders a green line between points (129, 46) and (71, 162).
; PLAN: r0=129(x1), r1=46(y1), r2=71(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 46
LDI r2, 71
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
