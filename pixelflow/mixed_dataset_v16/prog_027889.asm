; DESCRIPTION: Places a white line segment connecting (71, 83) to (470, 231).
; PLAN: r0=71(x1), r1=83(y1), r2=470(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 83
LDI r2, 470
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
