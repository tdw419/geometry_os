; DESCRIPTION: Places a white line segment connecting (231, 145) to (207, 152).
; PLAN: r0=231(x1), r1=145(y1), r2=207(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 145
LDI r2, 207
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
