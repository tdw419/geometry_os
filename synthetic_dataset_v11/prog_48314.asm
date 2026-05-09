; DESCRIPTION: Places a white line segment connecting (1, 148) to (87, 143).
; PLAN: r0=1(x1), r1=148(y1), r2=87(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 148
LDI r2, 87
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
