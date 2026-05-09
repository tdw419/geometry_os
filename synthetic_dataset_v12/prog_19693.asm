; DESCRIPTION: Places a white line segment connecting (259, 47) to (240, 149).
; PLAN: r0=259(x1), r1=47(y1), r2=240(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 47
LDI r2, 240
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
