; DESCRIPTION: Places a magenta line segment connecting (172, 175) to (255, 90).
; PLAN: r0=172(x1), r1=175(y1), r2=255(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 175
LDI r2, 255
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
