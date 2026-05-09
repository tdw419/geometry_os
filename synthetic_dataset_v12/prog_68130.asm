; DESCRIPTION: Places a white line segment connecting (411, 152) to (44, 179).
; PLAN: r0=411(x1), r1=152(y1), r2=44(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 152
LDI r2, 44
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
