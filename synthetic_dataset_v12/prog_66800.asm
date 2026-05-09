; DESCRIPTION: Places a white line segment connecting (220, 114) to (386, 31).
; PLAN: r0=220(x1), r1=114(y1), r2=386(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 114
LDI r2, 386
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
