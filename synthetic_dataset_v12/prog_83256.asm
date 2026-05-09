; DESCRIPTION: Places a white line segment connecting (440, 70) to (55, 154).
; PLAN: r0=440(x1), r1=70(y1), r2=55(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 70
LDI r2, 55
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
