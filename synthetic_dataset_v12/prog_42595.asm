; DESCRIPTION: Places a white line segment connecting (21, 44) to (510, 102).
; PLAN: r0=21(x1), r1=44(y1), r2=510(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 44
LDI r2, 510
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
