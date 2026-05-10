; DESCRIPTION: Places a white line segment connecting (169, 254) to (135, 57).
; PLAN: r0=169(x1), r1=254(y1), r2=135(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 254
LDI r2, 135
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
