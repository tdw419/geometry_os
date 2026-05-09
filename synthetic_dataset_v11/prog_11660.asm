; DESCRIPTION: Draws a orange line from (58, 16) to (29, 222).
; PLAN: r0=58(x1), r1=16(y1), r2=29(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 16
LDI r2, 29
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
