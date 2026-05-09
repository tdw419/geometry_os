; DESCRIPTION: Places a white line segment connecting (364, 69) to (393, 132).
; PLAN: r0=364(x1), r1=69(y1), r2=393(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 69
LDI r2, 393
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
