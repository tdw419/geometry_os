; DESCRIPTION: Renders a yellow line between points (1, 202) and (229, 161).
; PLAN: r0=1(x1), r1=202(y1), r2=229(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 202
LDI r2, 229
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
