; DESCRIPTION: Places a red line segment connecting (33, 124) to (393, 135).
; PLAN: r0=33(x1), r1=124(y1), r2=393(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 124
LDI r2, 393
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
