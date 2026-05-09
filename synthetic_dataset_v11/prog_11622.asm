; DESCRIPTION: Renders a black line between points (138, 108) and (241, 186).
; PLAN: r0=138(x1), r1=108(y1), r2=241(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 108
LDI r2, 241
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
