; DESCRIPTION: Places a green line segment connecting (71, 122) to (371, 218).
; PLAN: r0=71(x1), r1=122(y1), r2=371(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 122
LDI r2, 371
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
