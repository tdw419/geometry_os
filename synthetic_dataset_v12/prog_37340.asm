; DESCRIPTION: Places a white line segment connecting (259, 228) to (369, 69).
; PLAN: r0=259(x1), r1=228(y1), r2=369(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 228
LDI r2, 369
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
