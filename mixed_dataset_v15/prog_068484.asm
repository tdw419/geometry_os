; DESCRIPTION: Renders a yellow line between points (461, 186) and (234, 70).
; PLAN: r0=461(x1), r1=186(y1), r2=234(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 186
LDI r2, 234
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
