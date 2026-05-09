; DESCRIPTION: Places a white line segment connecting (16, 48) to (7, 11).
; PLAN: r0=16(x1), r1=48(y1), r2=7(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 48
LDI r2, 7
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
