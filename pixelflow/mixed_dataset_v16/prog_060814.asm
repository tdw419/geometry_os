; DESCRIPTION: Places a white line segment connecting (294, 249) to (369, 172).
; PLAN: r0=294(x1), r1=249(y1), r2=369(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 249
LDI r2, 369
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
