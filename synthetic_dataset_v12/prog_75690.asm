; DESCRIPTION: Places a white line segment connecting (262, 45) to (238, 79).
; PLAN: r0=262(x1), r1=45(y1), r2=238(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 45
LDI r2, 238
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
