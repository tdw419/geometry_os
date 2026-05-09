; DESCRIPTION: Places a white line segment connecting (288, 33) to (465, 38).
; PLAN: r0=288(x1), r1=33(y1), r2=465(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 33
LDI r2, 465
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
