; DESCRIPTION: Places a green line segment connecting (185, 116) to (59, 65).
; PLAN: r0=185(x1), r1=116(y1), r2=59(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 116
LDI r2, 59
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
