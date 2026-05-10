; DESCRIPTION: Places a white line segment connecting (372, 236) to (268, 181).
; PLAN: r0=372(x1), r1=236(y1), r2=268(x2), r3=181(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 236
LDI r2, 268
LDI r3, 181
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
