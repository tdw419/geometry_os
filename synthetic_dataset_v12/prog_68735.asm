; DESCRIPTION: Places a white line segment connecting (95, 162) to (263, 234).
; PLAN: r0=95(x1), r1=162(y1), r2=263(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 162
LDI r2, 263
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
