; DESCRIPTION: Places a yellow line segment connecting (416, 166) to (178, 86).
; PLAN: r0=416(x1), r1=166(y1), r2=178(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 166
LDI r2, 178
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
