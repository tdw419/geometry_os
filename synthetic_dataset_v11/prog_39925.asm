; DESCRIPTION: Places a white line segment connecting (15, 63) to (45, 202).
; PLAN: r0=15(x1), r1=63(y1), r2=45(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 63
LDI r2, 45
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
