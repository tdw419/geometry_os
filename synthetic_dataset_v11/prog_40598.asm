; DESCRIPTION: Draws a yellow line from (225, 155) to (69, 253).
; PLAN: r0=225(x1), r1=155(y1), r2=69(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 155
LDI r2, 69
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
