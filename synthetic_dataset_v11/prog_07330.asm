; DESCRIPTION: Renders a black line between points (69, 238) and (171, 54).
; PLAN: r0=69(x1), r1=238(y1), r2=171(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 238
LDI r2, 171
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
