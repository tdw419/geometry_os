; DESCRIPTION: Draws a yellow line from (255, 108) to (335, 114).
; PLAN: r0=255(x1), r1=108(y1), r2=335(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 108
LDI r2, 335
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
