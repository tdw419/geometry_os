; DESCRIPTION: Places a red line segment connecting (203, 142) to (103, 152).
; PLAN: r0=203(x1), r1=142(y1), r2=103(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 142
LDI r2, 103
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
