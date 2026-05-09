; DESCRIPTION: Renders a black line between points (310, 207) and (419, 207).
; PLAN: r0=310(x1), r1=207(y1), r2=419(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 207
LDI r2, 419
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
