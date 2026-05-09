; DESCRIPTION: Places a white line segment connecting (357, 58) to (176, 215).
; PLAN: r0=357(x1), r1=58(y1), r2=176(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 58
LDI r2, 176
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
