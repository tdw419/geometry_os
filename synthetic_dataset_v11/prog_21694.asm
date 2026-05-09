; DESCRIPTION: Places a orange line segment connecting (207, 255) to (186, 174).
; PLAN: r0=207(x1), r1=255(y1), r2=186(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 255
LDI r2, 186
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
