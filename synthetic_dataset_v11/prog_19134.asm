; DESCRIPTION: Places a white line segment connecting (123, 249) to (178, 78).
; PLAN: r0=123(x1), r1=249(y1), r2=178(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 249
LDI r2, 178
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
