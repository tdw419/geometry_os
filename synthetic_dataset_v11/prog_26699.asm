; DESCRIPTION: Renders a black line between points (233, 70) and (193, 249).
; PLAN: r0=233(x1), r1=70(y1), r2=193(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 70
LDI r2, 193
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
