; DESCRIPTION: Places a white line segment connecting (389, 52) to (42, 237).
; PLAN: r0=389(x1), r1=52(y1), r2=42(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 52
LDI r2, 42
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
