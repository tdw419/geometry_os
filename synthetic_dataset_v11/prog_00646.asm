; DESCRIPTION: Places a white line segment connecting (40, 164) to (143, 52).
; PLAN: r0=40(x1), r1=164(y1), r2=143(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 164
LDI r2, 143
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
