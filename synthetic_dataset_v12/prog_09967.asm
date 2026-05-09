; DESCRIPTION: Draws a yellow line from (225, 175) to (350, 202).
; PLAN: r0=225(x1), r1=175(y1), r2=350(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 175
LDI r2, 350
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
