; DESCRIPTION: Places a white line segment connecting (87, 169) to (254, 177).
; PLAN: r0=87(x1), r1=169(y1), r2=254(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 169
LDI r2, 254
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
