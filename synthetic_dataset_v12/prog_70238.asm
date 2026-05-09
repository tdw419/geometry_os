; DESCRIPTION: Places a white line segment connecting (193, 152) to (95, 19).
; PLAN: r0=193(x1), r1=152(y1), r2=95(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 152
LDI r2, 95
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
