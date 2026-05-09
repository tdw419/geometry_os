; DESCRIPTION: Places a yellow line segment connecting (108, 255) to (425, 44).
; PLAN: r0=108(x1), r1=255(y1), r2=425(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 255
LDI r2, 425
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
