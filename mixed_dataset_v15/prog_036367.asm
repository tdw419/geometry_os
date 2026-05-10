; DESCRIPTION: Renders a black line between points (299, 200) and (212, 171).
; PLAN: r0=299(x1), r1=200(y1), r2=212(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 200
LDI r2, 212
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
