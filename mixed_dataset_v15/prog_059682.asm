; DESCRIPTION: Places a white line segment connecting (86, 26) to (72, 164).
; PLAN: r0=86(x1), r1=26(y1), r2=72(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 26
LDI r2, 72
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
