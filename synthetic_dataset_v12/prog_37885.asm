; DESCRIPTION: Renders a green line between points (141, 55) and (19, 253).
; PLAN: r0=141(x1), r1=55(y1), r2=19(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 55
LDI r2, 19
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
