; DESCRIPTION: Places a white line segment connecting (266, 247) to (45, 50).
; PLAN: r0=266(x1), r1=247(y1), r2=45(x2), r3=50(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 247
LDI r2, 45
LDI r3, 50
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
