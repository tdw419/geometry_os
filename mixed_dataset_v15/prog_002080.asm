; DESCRIPTION: Places a white line segment connecting (223, 170) to (398, 192).
; PLAN: r0=223(x1), r1=170(y1), r2=398(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 170
LDI r2, 398
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
