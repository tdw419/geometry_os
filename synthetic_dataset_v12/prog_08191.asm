; DESCRIPTION: Draws a yellow line from (364, 240) to (144, 29).
; PLAN: r0=364(x1), r1=240(y1), r2=144(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 240
LDI r2, 144
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
