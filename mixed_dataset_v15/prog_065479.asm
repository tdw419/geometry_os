; DESCRIPTION: Renders a white line between points (141, 73) and (499, 160).
; PLAN: r0=141(x1), r1=73(y1), r2=499(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 73
LDI r2, 499
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
