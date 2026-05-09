; DESCRIPTION: Places a white line segment connecting (117, 195) to (424, 162).
; PLAN: r0=117(x1), r1=195(y1), r2=424(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 195
LDI r2, 424
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
