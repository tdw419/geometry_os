; DESCRIPTION: Renders a black line between points (372, 33) and (467, 100).
; PLAN: r0=372(x1), r1=33(y1), r2=467(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 33
LDI r2, 467
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
