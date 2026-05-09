; DESCRIPTION: Places a white line segment connecting (260, 69) to (253, 55).
; PLAN: r0=260(x1), r1=69(y1), r2=253(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 69
LDI r2, 253
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
