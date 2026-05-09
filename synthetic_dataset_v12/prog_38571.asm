; DESCRIPTION: Places a black line segment connecting (467, 165) to (3, 55).
; PLAN: r0=467(x1), r1=165(y1), r2=3(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 165
LDI r2, 3
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
