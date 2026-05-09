; DESCRIPTION: Renders a green line between points (14, 46) and (241, 141).
; PLAN: r0=14(x1), r1=46(y1), r2=241(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 46
LDI r2, 241
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
