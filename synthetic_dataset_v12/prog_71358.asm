; DESCRIPTION: Places a white line segment connecting (103, 132) to (124, 5).
; PLAN: r0=103(x1), r1=132(y1), r2=124(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 132
LDI r2, 124
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
