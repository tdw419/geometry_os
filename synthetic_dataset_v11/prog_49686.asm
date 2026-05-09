; DESCRIPTION: Places a white line segment connecting (9, 139) to (196, 6).
; PLAN: r0=9(x1), r1=139(y1), r2=196(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 139
LDI r2, 196
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
