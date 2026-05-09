; DESCRIPTION: Places a red line segment connecting (105, 194) to (152, 55).
; PLAN: r0=105(x1), r1=194(y1), r2=152(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 194
LDI r2, 152
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
