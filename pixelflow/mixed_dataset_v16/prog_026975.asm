; DESCRIPTION: Renders a black line between points (138, 46) and (176, 233).
; PLAN: r0=138(x1), r1=46(y1), r2=176(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 46
LDI r2, 176
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
