; DESCRIPTION: Places a white line segment connecting (69, 231) to (452, 58).
; PLAN: r0=69(x1), r1=231(y1), r2=452(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 231
LDI r2, 452
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
