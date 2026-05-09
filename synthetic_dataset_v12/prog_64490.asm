; DESCRIPTION: Places a black line segment connecting (275, 5) to (177, 177).
; PLAN: r0=275(x1), r1=5(y1), r2=177(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 5
LDI r2, 177
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
