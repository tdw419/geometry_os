; DESCRIPTION: Places a black line segment connecting (186, 199) to (69, 207).
; PLAN: r0=186(x1), r1=199(y1), r2=69(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 199
LDI r2, 69
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
