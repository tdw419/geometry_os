; DESCRIPTION: Places a white line segment connecting (9, 63) to (308, 164).
; PLAN: r0=9(x1), r1=63(y1), r2=308(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 63
LDI r2, 308
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
