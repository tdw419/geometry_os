; DESCRIPTION: Places a white line segment connecting (431, 108) to (174, 193).
; PLAN: r0=431(x1), r1=108(y1), r2=174(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 108
LDI r2, 174
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
