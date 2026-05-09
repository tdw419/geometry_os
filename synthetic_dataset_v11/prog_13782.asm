; DESCRIPTION: Places a white line segment connecting (21, 127) to (127, 201).
; PLAN: r0=21(x1), r1=127(y1), r2=127(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 127
LDI r2, 127
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
