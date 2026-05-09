; DESCRIPTION: Renders a green line between points (161, 218) and (178, 241).
; PLAN: r0=161(x1), r1=218(y1), r2=178(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 218
LDI r2, 178
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
