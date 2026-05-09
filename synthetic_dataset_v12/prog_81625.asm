; DESCRIPTION: Places a white line segment connecting (152, 117) to (175, 52).
; PLAN: r0=152(x1), r1=117(y1), r2=175(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 117
LDI r2, 175
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
