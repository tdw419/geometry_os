; DESCRIPTION: Renders a yellow line between points (133, 27) and (425, 161).
; PLAN: r0=133(x1), r1=27(y1), r2=425(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 27
LDI r2, 425
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
