; DESCRIPTION: Places a white line segment connecting (225, 97) to (28, 43).
; PLAN: r0=225(x1), r1=97(y1), r2=28(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 97
LDI r2, 28
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
