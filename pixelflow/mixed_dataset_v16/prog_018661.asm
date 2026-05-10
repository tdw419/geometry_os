; DESCRIPTION: Renders a black line between points (35, 141) and (68, 195).
; PLAN: r0=35(x1), r1=141(y1), r2=68(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 141
LDI r2, 68
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
