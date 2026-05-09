; DESCRIPTION: Places a yellow line segment connecting (182, 150) to (255, 250).
; PLAN: r0=182(x1), r1=150(y1), r2=255(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 150
LDI r2, 255
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
