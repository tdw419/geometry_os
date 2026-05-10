; DESCRIPTION: Places a white line segment connecting (288, 244) to (438, 96).
; PLAN: r0=288(x1), r1=244(y1), r2=438(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 244
LDI r2, 438
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
