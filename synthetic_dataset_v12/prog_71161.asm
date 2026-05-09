; DESCRIPTION: Places a white line segment connecting (421, 198) to (311, 213).
; PLAN: r0=421(x1), r1=198(y1), r2=311(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 198
LDI r2, 311
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
