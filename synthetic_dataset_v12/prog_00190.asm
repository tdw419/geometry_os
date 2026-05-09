; DESCRIPTION: Places a red line segment connecting (217, 137) to (416, 166).
; PLAN: r0=217(x1), r1=137(y1), r2=416(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 137
LDI r2, 416
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
