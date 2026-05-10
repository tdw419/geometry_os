; DESCRIPTION: Places a white line segment connecting (414, 236) to (146, 220).
; PLAN: r0=414(x1), r1=236(y1), r2=146(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 236
LDI r2, 146
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
