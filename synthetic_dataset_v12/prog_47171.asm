; DESCRIPTION: Places a white line segment connecting (114, 68) to (445, 71).
; PLAN: r0=114(x1), r1=68(y1), r2=445(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 68
LDI r2, 445
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
