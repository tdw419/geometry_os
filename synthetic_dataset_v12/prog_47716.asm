; DESCRIPTION: Places a white line segment connecting (44, 50) to (460, 10).
; PLAN: r0=44(x1), r1=50(y1), r2=460(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 50
LDI r2, 460
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
