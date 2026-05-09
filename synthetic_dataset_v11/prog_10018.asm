; DESCRIPTION: Places a white line segment connecting (244, 174) to (171, 191).
; PLAN: r0=244(x1), r1=174(y1), r2=171(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 174
LDI r2, 171
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
