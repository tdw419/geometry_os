; DESCRIPTION: Renders a black line between points (26, 247) and (182, 24).
; PLAN: r0=26(x1), r1=247(y1), r2=182(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 247
LDI r2, 182
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
