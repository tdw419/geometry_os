; DESCRIPTION: Renders a black line between points (18, 74) and (214, 31).
; PLAN: r0=18(x1), r1=74(y1), r2=214(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 74
LDI r2, 214
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
