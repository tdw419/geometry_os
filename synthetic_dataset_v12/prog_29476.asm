; DESCRIPTION: Places a magenta line segment connecting (255, 29) to (339, 12).
; PLAN: r0=255(x1), r1=29(y1), r2=339(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 29
LDI r2, 339
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
