; DESCRIPTION: Places a white line segment connecting (300, 186) to (367, 232).
; PLAN: r0=300(x1), r1=186(y1), r2=367(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 186
LDI r2, 367
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
