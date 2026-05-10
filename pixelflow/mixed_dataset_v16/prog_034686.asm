; DESCRIPTION: Places a red line segment connecting (138, 58) to (69, 14).
; PLAN: r0=138(x1), r1=58(y1), r2=69(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 58
LDI r2, 69
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
