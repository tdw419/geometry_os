; DESCRIPTION: Places a white line segment connecting (462, 70) to (454, 174).
; PLAN: r0=462(x1), r1=70(y1), r2=454(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 70
LDI r2, 454
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
