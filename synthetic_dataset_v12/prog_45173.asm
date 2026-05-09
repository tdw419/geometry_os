; DESCRIPTION: Places a white line segment connecting (353, 124) to (169, 177).
; PLAN: r0=353(x1), r1=124(y1), r2=169(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 124
LDI r2, 169
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
