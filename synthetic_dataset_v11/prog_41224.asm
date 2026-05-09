; DESCRIPTION: Renders a black line between points (172, 215) and (73, 140).
; PLAN: r0=172(x1), r1=215(y1), r2=73(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 215
LDI r2, 73
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
