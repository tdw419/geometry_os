; DESCRIPTION: Renders a black line between points (193, 243) and (172, 93).
; PLAN: r0=193(x1), r1=243(y1), r2=172(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 243
LDI r2, 172
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
