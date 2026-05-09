; DESCRIPTION: Places a white line segment connecting (451, 52) to (350, 42).
; PLAN: r0=451(x1), r1=52(y1), r2=350(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 52
LDI r2, 350
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
