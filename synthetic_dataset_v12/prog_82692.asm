; DESCRIPTION: Renders a black line between points (124, 65) and (202, 193).
; PLAN: r0=124(x1), r1=65(y1), r2=202(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 65
LDI r2, 202
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
