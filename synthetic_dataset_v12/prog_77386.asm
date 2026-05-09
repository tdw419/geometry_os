; DESCRIPTION: Places a green line segment connecting (269, 175) to (299, 142).
; PLAN: r0=269(x1), r1=175(y1), r2=299(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 175
LDI r2, 299
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
