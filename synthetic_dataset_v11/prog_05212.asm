; DESCRIPTION: Places a white line segment connecting (72, 186) to (95, 115).
; PLAN: r0=72(x1), r1=186(y1), r2=95(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 186
LDI r2, 95
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
