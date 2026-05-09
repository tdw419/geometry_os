; DESCRIPTION: Draws a yellow line from (69, 8) to (219, 208).
; PLAN: r0=69(x1), r1=8(y1), r2=219(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 8
LDI r2, 219
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
