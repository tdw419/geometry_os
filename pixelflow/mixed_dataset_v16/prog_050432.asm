; DESCRIPTION: Draws a yellow line from (376, 165) to (175, 218).
; PLAN: r0=376(x1), r1=165(y1), r2=175(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 165
LDI r2, 175
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
