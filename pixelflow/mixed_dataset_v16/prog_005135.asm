; DESCRIPTION: Places a white line segment connecting (433, 58) to (293, 46).
; PLAN: r0=433(x1), r1=58(y1), r2=293(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 58
LDI r2, 293
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
