; DESCRIPTION: Places a red line segment connecting (217, 203) to (117, 186).
; PLAN: r0=217(x1), r1=203(y1), r2=117(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 203
LDI r2, 117
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
