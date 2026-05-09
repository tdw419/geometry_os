; DESCRIPTION: Places a white line segment connecting (150, 186) to (219, 156).
; PLAN: r0=150(x1), r1=186(y1), r2=219(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 186
LDI r2, 219
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
