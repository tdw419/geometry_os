; DESCRIPTION: Places a white line segment connecting (487, 115) to (311, 172).
; PLAN: r0=487(x1), r1=115(y1), r2=311(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 115
LDI r2, 311
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
